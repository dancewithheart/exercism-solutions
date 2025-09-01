object FlattenArray:
  def flatten[X](xs : List[Any]): List[X] =
    xs.foldLeft[List[X]](Nil){
      case (ys : List[_], null) => flatten(ys)
      case (ys : List[_], zs : List[_]) => flatten(ys) ++ flatten(zs)
      case (ys : List[_], y: X) => flatten(ys) :+ y
    }