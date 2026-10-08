package my_math
public func multiply(a: Int64, b: Int64): Int64 {
    return a * b
}
public func factorial(n: Int64): Int64 {
    if (n <= 1) { return 1 }
    return n * factorial(n - 1)
}