package my_ext
public func factorial(n: Int64): Int64 {
    if (n <= 1) {
        return 1
    }
    return n * factorial(n - 1)
}
public func fibonacci(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}
public func deadExtFunc(): Int64 {
    return 0
}
