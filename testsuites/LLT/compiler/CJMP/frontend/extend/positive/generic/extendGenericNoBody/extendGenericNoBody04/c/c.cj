package cmp
class Foo1<T>{ }
class Foo2<U>{}
common extend<U, T> Foo1<U> <: Foo2<T> & String where U <: T & String{
}
