import scala.annotation.tailrec

object BinarySearch:
  def find(xs: List[Int], x: Int): Option[Int] =

    @tailrec
    def loop(low: Int, hi: Int): Option[Int] =
      if low > hi then None
      else
        val idx: Int = (hi + low) / 2
        xs(idx) match
         case middleElem if middleElem == x => Some(idx)
         case middleElem if x > middleElem  => loop(idx + 1, hi)
         case _ => loop(low, idx - 1)
    loop(0, xs.length-1)