object AllYourBase:
  def toBase(xs: List[Int], base: Int): Long =
    xs.reverse.zipWithIndex.foldLeft(0L){ case (acc, (a, idx)) =>
      acc + Math.pow(base, idx).toLong * a
    }

  def fromBase(n: Long, base: Int): List[Int] =
    def loop(curr: Long, soFar: List[Int]): List[Int] =
      if curr < base then curr.toInt :: soFar
      else loop(curr / base, (curr % base).toInt :: soFar)
    loop(n, Nil)

  def rebase(srcBase: Int, xs: List[Int], destBase: Int): Option[List[Int]] =
    // base have to be > 1
    // digits cannot be >= src base
    if destBase <= 1 || srcBase <= 1 || xs.exists(n => n >= srcBase || n < 0) then None
    else
      if xs.isEmpty then Some(List(0))
      else Some( fromBase(toBase(xs, srcBase), destBase) )
