package my_algo
public func sumArray(arr: Array<Int64>): Int64 {
    var s = 0
    for (x in arr) {
        s += x
    }
    return s
}
public func maxOf(a: Int64, b: Int64): Int64 {
    if (a > b) {
        return a
    }
    return b
}
public func buildString(): String {
    var s = ""
    for (i in 0..5) {
        s += i.toString()
    }
    return s
}
public func deadAlgoFunc(): Int64 {
    return -1
}
