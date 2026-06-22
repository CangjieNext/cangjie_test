package lib

public struct S {
    let x: Int64 = 1
    let y: Int64 = 2
}

public func foo(x: Int64): S {
    if (x > 0) {
        return S()
    } else {
        return S()
    }
}
