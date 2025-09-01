object Say:
  extension (a: Option[String]) infix def |+|(b: Option[String]): Option[String] =
    (a,b) match
      case (Some(a), Some(b)) => Some(a + " " + b)
      case _ => None

  extension (a: Option[String]) infix def |-|(b: Option[String]): Option[String] =
    (a,b) match
      case (Some(a), Some(b)) => Some(a + "-" + b)
      case _ => None

  def inEnglish(n: Long): Option[String] = n match
    case n if n < 0 || n > 999999999999L => None

    case 0 => Some("zero")
    case 1 => Some("one")
    case 2 => Some("two")
    case 3 => Some("three")
    case 4 => Some("four")
    case 5 => Some("five")
    case 6 => Some("six")
    case 7 => Some("seven")
    case 8 => Some("eight")
    case 9 => Some("nine")
    case 10 => Some("ten")

    case 11 => Some("eleven")
    case 12 => Some("twelve")
    case 13 => Some("thirteen")
    case 14 => Some("fourteen")
    case 15 => Some("fifteen")
    case 16 => Some("sixteen")
    case 17 => Some("seventeen")
    case 18 => Some("eighteen")
    case 19 => Some("nineteen")

    case 20 => Some("twenty")
    case 30 => Some("thirty")
    case 40 => Some("forty")
    case 50 => Some("fifty")
    case 60 => Some("sixty")
    case 70 => Some("seventy")
    case 80 => Some("eighty")
    case 90 => Some("ninety")

    case n if (n > 1000000000-1) && (n % 1000000000 == 0) => inEnglish(n / 1000000000) |+| Some("billion")
    case n if (n < 1000*1000000) && (n > 1000000-1) && (n % 1000000 == 0) => inEnglish(n / 1000000) |+| Some("million")
    case n if (n < 1000*1000) && (n > 1000-1) && (n % 1000 == 0) => inEnglish(n / 1000) |+| Some("thousand")
    case n if (n < 10*100) && (n > 100-1) && (n % 100 == 0) => inEnglish(n / 100) |+| Some("hundred")

    case n if (n > 1000000000-1) => inEnglish(n/1000000000) |+| Some("billion") |+| inEnglish(n % 1000000000)
    case n if (n < 1000*1000000) && (n > 1000000-1) => inEnglish(n/1000000) |+| Some("million") |+| inEnglish(n % 1000000)
    case n if (n < 1000*1000) && (n > 1000-1) => inEnglish(n/1000) |+| Some("thousand") |+| inEnglish(n % 1000)
    case n if (n < 10*100) && (n > 100-1) => inEnglish(n/100) |+| Some("hundred") |+| inEnglish(n % 100)
    case n if (n > 20) && (n < 100) => inEnglish( (n / 10) * 10 ) |-| inEnglish(n % 10)
