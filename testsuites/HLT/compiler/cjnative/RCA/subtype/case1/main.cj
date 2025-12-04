// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public enum MyOption<T> {
    | Some(T)
    | None

    public func getOrThrow(): T {
        match (this) {
            case Some(t) => t
            case None => throw Exception()
        }
    }
}

public interface IA<T> {
    func foo(a: T, b: String, c: MyOption<String>): MyOption<T>
    func foo(a: T, b: String): MyOption<T> {
        println("ccc")
        foo(a, b, MyOption<String>.None)
    }
}

public class CA<T> <: IA<CA<T>> {
    public func foo(a: CA<T>, b: String, _: MyOption<String>): MyOption<CA<T>> {
        return MyOption<CA<T>>.Some(a)
    }
}

main(): Unit {
    let c = CA<Int64>()
    c.foo(c, "A").getOrThrow()
}
