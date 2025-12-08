// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super

open class A {
    let x: A
    public A(x: A) {
        this.x = x
    }
}

class B <: A {
    public B() {
        super(this.x)
    }
}

main(): Int64 {
    let b = B()
    let a = b.x
    let aa = a.x
    return 0
}
