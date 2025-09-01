object Change:
  type Amount = Int
  type Coin = Int
  type Solution = Option[List[Coin]]
  val Solution0: Solution = Some(Nil)
  val NoSolutions: Solution = None

  private val initMem: Map[Coin, Solution] = Map(0 -> Solution0)

  def findFewestCoins(amount: Amount, coins: List[Coin]): Solution = amount match
    case 0 => Solution0
    case amount if amount < 0 => NoSolutions
    case _ => (1 to amount)
      .foldLeft(initMem) { (memoized, n) =>
          val sn = minCoinsMemo(n, coins, memoized)
          memoized + (n -> sn)
      }
      .getOrElse(amount, NoSolutions)

  private def minCoinsMemo(amount: Amount, coins: List[Coin], smallerSolutions: Map[Coin,Solution]): Solution =
    minSolution(
      coins.filter(_ <= amount)
        .sortBy(-_)
        .map { currCoin =>
          smallerSolutions(amount - currCoin)
            .map(noCoinSolution => noCoinSolution :+ currCoin)
        })

  def minSolution(xs : List[Solution]): Solution = xs.flatten match
    case Nil => NoSolutions
    case ys => Some(ys.minBy(_.length))