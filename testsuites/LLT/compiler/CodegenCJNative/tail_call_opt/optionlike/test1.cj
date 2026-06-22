package lib

public enum MaybeInt {
    | None
    | Some(Int64)
}

public func foo(x: Int64): MaybeInt {
    if (x > 0) {
        return MaybeInt.Some(x)
    } else {
        return MaybeInt.None
    }
}
