

interface Callable<A, R> { func invoke(a: A): R }
class Target <: Callable<Int64, Int64> { public func invoke(a: Int64): Int64 { a + 1 } }
class Tam <: Callable<?Int, ?Int> {
    public func invoke(a: ?Int): ?Int {
        match(a) {
            case Some(x) => x+1
            case None => None
        }
    }
}

interface I<T> { func bar(x: T): T }
open class Base<T> {}
extend<T> Base<T> <: I<T> {
    public func bar(x: T): T {
        let a: Callable<Int64, Int64> = Target()
        a.invoke(0)
        let b: Callable<?Int, ?Int> = Tam()
        b.invoke(3)
        return x
    }
}

func f<T>(a: I<T>, b: T): T { a.bar(b) }
main(): Int64 { f(Base<Int64>(), 42); 0 }