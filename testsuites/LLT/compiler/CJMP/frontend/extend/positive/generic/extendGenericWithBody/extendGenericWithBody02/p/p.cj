package cmp
platform extend<T> Point<T> <: toString where T <: Int64{
    platform operator func -(): Point {
        return Point(-x, -y)
    }
    platform operator func +(right: Point): Point {
        return Point(x + right.x, y + right.y)
    }
    platform operator func *(right: Point): Point {
        return Point(x * right.x, y * right.y)
    }
}