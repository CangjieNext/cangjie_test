// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello

interface I<T> {}
abstract class C<T> {}
extend<T> C<T> <: I<T> where T <: I<T> {}
class D <: C<D> {}

main(): Unit {
    println("hello")
}
