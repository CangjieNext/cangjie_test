func test(): Unit {
    let a = TestEnum.A
    let b = B
    match(a) {
        case TestEnum.A => ()
        case _ => ()
    }
    match(b) {
        case B => ()
        case _ => ()
    }
    match(b) {
        case B | A => ()
        case _ => ()
    }
}