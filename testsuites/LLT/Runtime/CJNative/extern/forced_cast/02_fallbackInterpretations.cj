// EXEC-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// Shapes that look like a forced cast but must stay on the ordinary
// (non-forced-cast) path: a parenthesized function call `(foo)(x)` (including
// when the argument is Extern), and a parenthesized expression `(a + b)`.

class DummyRuntime <: Runtime<DummyRuntime> {
    public static func memberAccess(e: Extern<DummyRuntime>, field: String): Extern<DummyRuntime> { return e }
    public static func indexAccess(e: Extern<DummyRuntime>, arg: Any): Extern<DummyRuntime> { return e }
    public static func memberUpdate(e: Extern<DummyRuntime>, field: String, value: Any): Unit {}
    public static func indexUpdate(e: Extern<DummyRuntime>, field: Any, value: Any): Unit {}
    public static func functionCall(e: Extern<DummyRuntime>, args: Array<Any>): Extern<DummyRuntime> { return e }
    public static func fromExtern<R>(h: Extern<DummyRuntime>): R { return (getPayload(h) as R).getOrThrow() }
    public static func toExtern<R>(v: R): Extern<DummyRuntime> { return Extern<DummyRuntime>(v) }
}

func inc(x: Int64): Int64 { x + 1 }

func externArity(x: Extern<DummyRuntime>): Int64 { 42 }

func makeExtern(): Extern<DummyRuntime> { Extern<DummyRuntime>(0) }

main() {
    // (foo)(x): foo is a function -> ordinary call.
    let call = (inc)(1)
    // (foo)(externArg): still an ordinary call even though the arg is Extern.
    let callExtern = (externArity)(makeExtern())
    // (a + b): parenthesized expression, not a forced-cast candidate.
    let a: Int64 = 10
    let b: Int64 = 20
    let parenExpr = (a + b)

    if (call != 2 || callExtern != 42 || parenExpr != 30) {
        throw Exception("fallback interpretation failed")
    }
}
