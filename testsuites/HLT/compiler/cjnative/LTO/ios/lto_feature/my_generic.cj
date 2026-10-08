package my_generic
public func identity<T>(x: T): T {
    return x
}
public func swap<T>(a: T, b: T): (T, T) {
    return (b, a)
}
public func firstElement<T>(arr: Array<T>): T {
    return arr[0]
}
public func deadGenericFunc(): String {
    return "dead"
}
