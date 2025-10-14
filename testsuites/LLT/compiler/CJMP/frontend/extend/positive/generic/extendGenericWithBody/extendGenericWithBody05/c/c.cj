package cmp
class Foo1<T>{ }
class Foo2<U>{}
common extend<T, U> Foo1<T> <: Foo2<U> & String where T <: U & String{
}
