// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected member name or constructor call after 'Foo' type name

// Negative: a forced cast `(U)e` requires the operand to begin on the same line
// as `(U)`. A newline right after `(U)` ends the construct, so `(Foo)\ne` is no
// longer a forced-cast candidate -- `(Foo)` is read as the bare type name `Foo`,
// which then expects a member access or constructor call, not a following
// expression on the next line. (Contrast 09_dataFlowAndPipelines, where the
// newline falls after the operand, not after the type, and parsing succeeds.)

class Foo {
    let id: Int64
    public init(id: Int64) { this.id = id }
}

main() {
    let a = (Foo)
        Foo(7)
}
