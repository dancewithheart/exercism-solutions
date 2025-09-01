import ForthError.ForthError

import scala.annotation.tailrec
import scala.collection.mutable

sealed trait Word(val rep: String)
object Word:
  case class Command(str: String) extends Word(str)
  case class Number(n: Int) extends Word(n.toString)
  val DUP: Command = Command("DUP")
  val DROP: Command = Command("DROP")
  val SWAP: Command = Command("SWAP")
  val OVER: Command = Command("OWER")
  val Plus: Command = Command("+")
  val Mins: Command = Command("-")
  val Multi: Command = Command("*")
  val Div: Command = Command("/")
  val CustomCommandStart: Command = Command(":")
  val CustomCommandEnd: Command = Command(";")
  def isArithOp(x: Word): Boolean = List(Word.Div, Word.Multi, Word.Plus,Word.Mins).contains(x)

type CustomCommands = Map[Word.Command, List[Word]]

class ForthState(val stack: mutable.Stack[Word] = mutable.Stack.empty, val customCommands: CustomCommands)
  extends ForthEvaluatorState {

  def withCommand(newCommand: (Word.Command, List[Word])): ForthState = ForthState(stack, customCommands + newCommand)

  def handleOneArgOp(f: (mutable.Stack[Word], Word) => mutable.Stack[Word]): Either[ForthError, mutable.Stack[Word]] =
    if stack.isEmpty then ForthError.StackUnderflow.left
    else
      val arg = stack.pop()
      f(stack, arg).right

  def handleTwoArgOp(f: (mutable.Stack[Word], Word, Word) => mutable.Stack[Word]): Either[ForthError, mutable.Stack[Word]] =
    if stack.size < 2 then ForthError.StackUnderflow.left
    else
      val fst = stack.pop()
      val snd = stack.pop()
      f(stack, fst, snd).right

  override def toString: String = stack.map(w => w.rep).reverse.mkString(" ")
}

object ForthState:
  def empty: ForthState = ForthState(mutable.Stack.empty, Map.empty)

extension [A,B](a: B) def right: Either[A,B] = Right(a)
extension [A,B](a: A) def left: Either[A,B] = Left(a)

class Forth extends ForthEvaluator {
  def eval(text: String): Either[ForthError, ForthState] = evaluate(parse(text), ForthState.empty)

  private def parse(text: String): List[Word] =
    text.split(' ').map {
      case "+" => Word.Plus
      case "-" => Word.Mins
      case "*" => Word.Multi
      case "/" => Word.Div
      case str if str.toLowerCase == "dup" => Word.DUP
      case str if str.toLowerCase == "drop" => Word.DROP
      case str if str.toLowerCase == "swap" => Word.SWAP
      case str if str.toLowerCase == "over" => Word.OVER
      case ":" => Word.CustomCommandStart
      case ";" => Word.CustomCommandEnd
      case n => n.toIntOption match
        case Some(parsedInt) => Word.Number(parsedInt)
        case None => Word.Command(n.toLowerCase)
    }.toList

  private def evaluate(xs: List[Word], state: ForthState): Either[ForthError, ForthState] =
    evalLoop(mutable.Stack.from(xs), state)

  private def evalLoop(input: mutable.Stack[Word], state: ForthState): Either[ForthError, ForthState] =
    if input.isEmpty then state.right
    else evalWord(input, state, input.pop())

  private def evalWord(input: mutable.Stack[Word], state: ForthState, word: Word): Either[ForthError, ForthState] = {
    word match {
      case Word.Number(n) =>
        state.stack.push(word)
        evalLoop(input, state)
      case Word.CustomCommandEnd => ForthError.InvalidWord.left // should be consumed already
      case Word.CustomCommandStart =>
        val commandName = input.pop()
        commandName match
          case Word.Number(n) => ForthError.InvalidWord.left
          case cmdName: Word.Command =>
            consumeCustomCommand(input).flatMap( commandWords =>
              val newCommand = evaluate(commandWords.reverse, ForthState(mutable.Stack.empty, state.customCommands)) match
                case Left(error) => cmdName -> commandWords.reverse
                case Right(evaluatedCommands) => cmdName -> evaluatedCommands.stack.toList
              evalLoop(input, state.withCommand(newCommand))
            )
      case w: Word.Command if state.customCommands.contains(w) => // custom command
        state.customCommands.get(w) match
          case Some(commandWords) =>
            input.pushAll(commandWords)
            evalLoop(input, state)
          case None => ForthError.UnknownWord.left
      case Word.DUP =>
        state.handleOneArgOp((stack, a) => stack.push(a).push(a))
          .flatMap( _ => evalLoop(input, state) )
      case Word.DROP =>
        state.handleOneArgOp((stack, _) => stack)
          .flatMap( _ => evalLoop(input, state) )
      case Word.SWAP =>
        state.handleTwoArgOp((stack, fst, snd) => stack.push(fst).push(snd))
          .flatMap( _ => evalLoop(input, state) )
      case Word.OVER =>
        state.handleTwoArgOp((stack, fst, snd) => stack.push(snd).push(fst).push(snd))
          .flatMap( _ => evalLoop(input, state) )
      case n if Word.isArithOp(n) =>
        handleArithmetic(n, state.stack)
        .flatMap( _ => evalLoop(input, state) )
      case other => ForthError.UnknownWord.left
    }
  }

  @tailrec private def consumeCustomCommand(stack: mutable.Stack[Word], commandAcc: List[Word] = Nil): Either[ForthError, List[Word]] =
    if stack.isEmpty then ForthError.InvalidWord.left
    else stack.pop() match
      case Word.CustomCommandEnd => commandAcc.right
      case currWord => consumeCustomCommand(stack, currWord :: commandAcc)

  private def handleArithmetic(word: Word, stack: mutable.Stack[Word]): Either[ForthError, mutable.Stack[Word]] = {
    if stack.size < 2 then ForthError.StackUnderflow.left
    else
      val fst = stack.pop()
      val snd = stack.pop()
      if word == Word.Div && fst == Word.Number(0) then ForthError.DivisionByZero.left
      else
        (fst, snd) match
          case (Word.Number(n), Word.Number(m)) =>
            val computedWord = word match
              case Word.Mins => Word.Number(m - n)
              case Word.Multi => Word.Number(m * n)
              case Word.Div => Word.Number(m / n)
              case Word.Plus => Word.Number(m + n)
              case _ => throw new Error("unexpected argument " + word)
            stack.push(computedWord).right
          case _ => ForthError.InvalidWord.left
  }
}