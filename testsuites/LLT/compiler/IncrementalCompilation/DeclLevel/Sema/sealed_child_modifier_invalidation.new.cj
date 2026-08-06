abstract sealed class Root {}

class A <: Root {}
open class B <: Root {}

func f(v: Root): Int64 {
    return match (v) {
        case _: A => 0
        case _ => 1
    }
}

main(): Int64 {
    return f(A())
}
