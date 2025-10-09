package test.extendDecl



extend String {
    public func printSize()
}

public class Pair<T1, T2> {
    public init(a: T1, b: T2)
}

public interface Eq<T> {
    func equals(other: T): Bool
}

extend<T1, T2> Pair<T1, T2> where T1 <: Eq<T1>, T2 <: Eq<T2> {
    public func equals(other: Pair<T1, T2>)
}

public class Foo <: Eq<Foo> {
    public func equals(other: Foo): Bool
}