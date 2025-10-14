package cmp
class Foo<T>{ }
common extend<T> Foo<T> {
    common public func f1():Unit{println("Extend::Common::f1")}
}
