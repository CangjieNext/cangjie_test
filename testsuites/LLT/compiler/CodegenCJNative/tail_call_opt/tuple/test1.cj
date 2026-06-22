package lib

public func foo(x: Int64): (Int64, Int64) {
    if (x > 0) {
        return (x, x + 1)
    } else {
        return (-x, 0)
    }
}
