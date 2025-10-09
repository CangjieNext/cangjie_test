func test(): Unit {
    let a = 1
    match(a) {
        case 1 => ()
        case _ => ()
    }
    match {
        case a > b => 1
        case _ => 2
    }
    match {
        case decimal < 0.5 => integer
        case decimal > 0.5 => integer + 1.0
        case Int64(integer) % 2 == 0 => integer
        case _ => integer + 1.0
    }
}

class A {
    func funciton() {
        match {
            case this < rhs => Ordering.LT
            case this > rhs => Ordering.GT
            case _ => Ordering.EQ
        }
    }
}