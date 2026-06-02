func test(): Unit {
    let a: Int64 = 1
    let b = A()
    match(a) {
        case x: Int64 => ()
    }
    match(b) {
        case x: A => ()
    }
    match (test(input)) {
        case Ok(p: ClassA) where p.function() => println(1)
        case Ok(p: ClassA) => println(1)
        case Ok(other) => println(1)
        case Err(cause) => println(1)
    }

    match(xxx) {
        case _: T => { => }
    }
}