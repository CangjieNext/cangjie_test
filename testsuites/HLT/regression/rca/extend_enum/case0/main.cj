// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum E<T> {
    | AB
}

extend E<Rune> {
    static func f3(a: UInt32): UInt32 {
        println(a)
        a
    }
}

main(): Unit {
    var c3 = E.f3(2)
}
