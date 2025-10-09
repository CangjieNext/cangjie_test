func test(): Unit {
    let a = (1, 1)
    let b = ("abc", 2)
    match(a) {
        case (x, y) => ()
    }
    match(b) {
        case ("abc", x) => ()
        case(_, _) => ()
    }
}

class A {
    func function() {
        match ((this, that)) {
            case (LT, LT) | (EQ, EQ) | (GT, GT) => EQ
            case (LT, EQ) | (LT, GT) | (EQ, GT) => LT
            case _ => GT
        }
    }
}