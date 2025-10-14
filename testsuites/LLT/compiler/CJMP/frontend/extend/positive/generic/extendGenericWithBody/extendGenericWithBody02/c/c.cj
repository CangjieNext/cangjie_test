package cmp
class Point<T>{ 
    var x: T = 0
    var y: T = 0

    init(a : T, b : T) {
        x = a
        y = b
    }
}
common extend<T> Point<T> <: toString where T <: Int64 {
    common operator func -(): Point {}
    common operator func +(right: Point): Point {}
    common operator func *(right: Point): Point {}
    public func toString(): String {
        return "(" + toString(x) + ", " + toString(y) + ")" 
    }
}
