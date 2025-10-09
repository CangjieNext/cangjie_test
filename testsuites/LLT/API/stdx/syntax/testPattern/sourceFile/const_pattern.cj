func test(): Unit {
    let a = 1
    let b = false
    match(a) {
        case 1 => ()
        case _ => ()
    }
    match(b) {
        case true => ()
        case _ => ()
    }
    match (data[0]) {
        case '+' => return ([], 0)
        case '-' =>
            if (isSigned) {
                return ([], 0)
            } else {
                return ([], 0)
            }
        case _ => return ([], 0)
    }
}