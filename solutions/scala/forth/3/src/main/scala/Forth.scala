import ForthError.ForthError

import scala.annotation.tailrec
import scala.collection.mutable

trait Token(val rep: String)
object Token:
  case class Word(str: String) extends Token(str)
  case class NUMBER(n: Int) extends Token(n.toString)

  val DUP: Word = Word("DUP")
  val DROP: Word = Word("DROP")
  val SWAP: Word = Word("SWAP")
  val OVER: Word = Word("OWER")
  val Plus: Word = Word("+")
  val Mins: Word = Word("-")
  val Multi: Word = Word("*")
  val Div: Word = Word("/")
  val CustomCommandStart: Word = Word(":")
  val CustomCommandEnd: Word = Word(";")

  def isArithOp(x: Token): Boolean = List(Token.Div, Token.Multi, Token.Plus,Token.Mins).contains(x)

type CustomCommands = Map[Token.Word, List[Token]]

case class ForthState(stack: mutable.Stack[Token] = mutable.Stack.empty, customCommands: CustomCommands = Map.empty)
  extends ForthEvaluatorState {

  def withStack(newStack: mutable.Stack[Token]): ForthState = ForthState(newStack, customCommands)
  def withCommand(newCommand: (Token.Word, List[Token])): ForthState = ForthState(stack, customCommands + newCommand)

  def handleOneArgOp(f: (mutable.Stack[Token], Token) => mutable.Stack[Token]): Either[ForthError, mutable.Stack[Token]] =
    if stack.isEmpty then ForthError.StackUnderflow.left
    else
      val arg = stack.pop()
      f(stack, arg).right

  def handleTwoArgOp(f: (mutable.Stack[Token], Token, Token) => mutable.Stack[Token]): Either[ForthError, mutable.Stack[Token]] =
    if stack.size < 2 then ForthError.StackUnderflow.left
    else
      val fst = stack.pop()
      val snd = stack.pop()
      f(stack, fst, snd).right

  override def toString: String = stack.map(w => w.rep).reverse.mkString(" ")
}

def sequence[A](xs: List[Either[ForthError,A]]): Either[ForthError, List[A]] =
  xs match
    case head :: rest => head.flatMap(w => sequence(rest).map(ws => w :: ws) )
    case Nil => Nil.right

extension [A,B](a: B) def right: Either[A,B] = Right(a)
extension [A,B](a: A) def left: Either[A,B] = Left(a)

class Forth extends ForthEvaluator:
  def eval(text: String): Either[ForthError, ForthState] = evaluate(parse(text))

  private def parse(text: String): List[Token] =
    text.split(' ').map {
      case "+" => Token.Plus
      case "-" => Token.Mins
      case "*" => Token.Multi
      case "/" => Token.Div
      case str if str.toLowerCase == "dup" => Token.DUP
      case str if str.toLowerCase == "drop" => Token.DROP
      case str if str.toLowerCase == "swap" => Token.SWAP
      case str if str.toLowerCase == "over" => Token.OVER
      case ":" => Token.CustomCommandStart
      case ";" => Token.CustomCommandEnd
      case n => n.toIntOption match
        case Some(parsedInt) => Token.NUMBER(parsedInt)
        case None => Token.Word(n.toLowerCase)
    }.toList

  private def evaluate(xs: List[Token]): Either[ForthError, ForthState] =
    evalLoop(mutable.Stack.from(xs), ForthState())

  private def evalLoop(inputTokens: mutable.Stack[Token], accResult: ForthState): Either[ForthError, ForthState] =
    if inputTokens.isEmpty then accResult.right
    else {
      val currWord = inputTokens.pop()
        currWord match {
          case Token.NUMBER(n) =>
            accResult.stack.push(currWord)
            evalLoop(inputTokens, accResult)
          case Token.CustomCommandEnd => ForthError.InvalidWord.left // should be consumed already
          case Token.CustomCommandStart =>
              val commandName = inputTokens.pop()
              commandName match
                case Token.NUMBER(n) => ForthError.InvalidWord.left
                case cmdName : Token.Word =>
                  consumeCustomCommand(inputTokens) match
                    case Right(commandWords) =>
                      evalLoop(mutable.Stack.from(commandWords.reverse), accResult.withStack(mutable.Stack.empty)) match
                        case Left(error) =>
                          val newCommand = cmdName -> commandWords.reverse
                          val newStack = accResult.withCommand(newCommand)
                          evalLoop(inputTokens, newStack)
                        case Right(evaluatedCommands) =>
                          val newCommand = cmdName -> evaluatedCommands.stack.toList
                          val newStack = accResult.withCommand(newCommand)
                          evalLoop(inputTokens, newStack)
                    case Left(error) => Left(error)
          case w: Token.Word if accResult.customCommands.contains(w) => // custom command
            accResult.customCommands.get(w) match
              case Some(commandWords) => evalLoop(inputTokens.pushAll(commandWords), accResult)
              case None => ForthError.UnknownWord.left
          case Token.DUP =>
            accResult.handleOneArgOp((stack, a) => stack.push(a).push(a)) match
              case Left(error) => Left(error)
              case Right(newStack) => evalLoop(inputTokens, accResult)
          case Token.DROP =>
            accResult.handleOneArgOp((stack, _) => stack) match
              case Left(error) => Left(error)
              case Right(newStack) => evalLoop(inputTokens, accResult)
          case Token.SWAP =>
            accResult.handleTwoArgOp((stack, fst, snd) => stack.push(fst).push(snd)) match
              case Left(error) => Left(error)
              case Right(newStack) => evalLoop(inputTokens, accResult)
          case Token.OVER =>
            accResult.handleTwoArgOp((stack, fst, snd) => stack.push(snd).push(fst).push(snd)) match
              case Left(error) => Left(error)
              case Right(newStack) => evalLoop(inputTokens, accResult)
          case n if Token.isArithOp(n) => handleAritmetic(n, accResult.stack) match
            case Left(error) => Left(error)
            case Right(newStack) => evalLoop(inputTokens, accResult)
          case other => ForthError.UnknownWord.left
        }
      }

  @tailrec
  private def consumeCustomCommand(stack: mutable.Stack[Token], commandAcc: List[Token] = Nil): Either[ForthError, List[Token]] =
    if stack.isEmpty then ForthError.InvalidWord.left
    else stack.pop() match
      case Token.CustomCommandEnd => commandAcc.right
      case currWord => consumeCustomCommand(stack, currWord :: commandAcc)

  private def handleAritmetic(word: Token, stack: mutable.Stack[Token]): Either[ForthError, mutable.Stack[Token]] =
    if stack.size < 2 then ForthError.StackUnderflow.left
    else
      val fst = stack.pop()
      val snd = stack.pop()
      (fst, snd) match
        case (Token.NUMBER(n), Token.NUMBER(m)) =>
          if word == Token.Div && fst == Token.NUMBER(0) then ForthError.DivisionByZero.left
          else
            val computedWord = word match
              case Token.Mins => Token.NUMBER(m - n)
              case Token.Plus => Token.NUMBER(m + n)
              case Token.Multi => Token.NUMBER(m * n)
              case Token.Div => Token.NUMBER(m / n)
            stack.push(computedWord).right
        case _ => ForthError.InvalidWord.left
