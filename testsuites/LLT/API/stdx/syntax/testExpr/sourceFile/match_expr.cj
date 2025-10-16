func test(): Unit {
    match { case _ => 1 }

    match(a) {
        case v: Int64 => ()
        case 1.1 | 2.2 => ()
        case b where true => ()
        case _ => ()
    }

    match(A.a == b) {
        case true => ()
        case false => ()
    }

    match(10) {
        case 0 => ()
        case 70 | 80 => ()
        case 100 where false => println("a")
        case _ => throw Exception()
    }
}