package cmp
class Foo<T, U>{ }
common extend<T, U> Foo<T, U> <: toString where T <: U {
    type Point1D = T 
    type Point2D = (T, U)
    type Point3D = (T, U, U)
}
