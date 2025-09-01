object RunLengthEncoding:

  def encode(str: String): String =
    if(str.length <= 1) str
    else
      val init = firstStep(str.head)
      val rest = str.tail
      useBuffer(rest.foldLeft(init)(addChar)).encoded

  def decode(str: String): String =
    val init: (String, Option[String]) = ("", None)
    str.foldLeft(init) {
      case ((soFar, Some(numStr)), c) =>
        if c.isDigit then (soFar, Some(numStr + c))
        else (soFar + decodeChar(c, numStr.toInt), None)
      case ((soFar, None), c) =>
        if c.isDigit then (soFar, Some(c.toString))
        else (soFar + c, None)
    }._1

  private case class CharBuffer(char: Char, times: Int = 1)

  private case class EncodeStep(encoded: String, buffered: CharBuffer)

  private def firstStep(currChar: Char): EncodeStep = EncodeStep("", CharBuffer(currChar))

  private def useBuffer(step: EncodeStep): EncodeStep = step.copy(
    encoded = step.encoded + encodeChar(step.buffered)
  )

  private def encodeChar(c: CharBuffer): String =
    if c.times < 2 then c.char.toString
    else c.times.toString + c.char

  private def addChar(step: EncodeStep, currChar: Char): EncodeStep =
    if step.buffered.char == currChar then increment(step)
    else EncodeStep(step.encoded + encodeChar(step.buffered), CharBuffer(currChar))

  private def increment(step: EncodeStep): EncodeStep =
    EncodeStep(step.encoded, increment(step.buffered))

  private def increment(buffered: CharBuffer): CharBuffer =
    CharBuffer(buffered.char, buffered.times + 1)

  private def decodeChar(c: Char, times: Int): String = c.toString * times
