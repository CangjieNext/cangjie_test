func test(): Unit {
    let a = A(0)
    let b = B(true, "")
    match(a) {
        case A(n) => ()
        case _ => ()
    }
    match(a) {
        case B(m, n) => ()
        case _ => ()
    }
    match(a) {
        case A.B<T>.EnumElement => ()
        case _ => ()
    }
    match (getnode(node)  as Node) {
        case Some(v) => v.GetBegin()
        case None => throw ParseASTException()
    }
}

class A {
    func function() {
        match (this) {
            case NoValue => "NoValue"
            case RequiredValue => "RequiredValue"
            case OptionalValue => "OptionalValue"
        }
    }
}