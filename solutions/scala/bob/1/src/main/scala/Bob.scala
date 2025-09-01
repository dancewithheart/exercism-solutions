object Bob:
  def isQuestion(str: String): Boolean = str.endsWith("?")
  def isYell(str: String): Boolean = str.toUpperCase == str && str.exists(_.isLetter)

  def response(prompt: String): String =
    prompt.trim match
      case str if str.isBlank => "Fine. Be that way!"
      case str if isQuestion(str) && isYell(str) => "Calm down, I know what I'm doing!"
      case str if isQuestion(str) => "Sure."
      case str if isYell(str)=> "Whoa, chill out!"
      case _ => "Whatever."
