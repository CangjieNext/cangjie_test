func test(): Unit {
    { => 1 }
    { a: Int64 => 1 }
    { a: (Int64, (Int64)), b: A => let c = a * b
                                   return c }
    f() { => }
    f() { println() }
    f(1, "") { a: Int64 => return a}
    { a: ?Int64, b: (Int64), c: (Int64) -> Int64, d: T.A, e: A, f: VArray<Int64, $3> => return a ?? 0 }
    { a => a + 1 }
}