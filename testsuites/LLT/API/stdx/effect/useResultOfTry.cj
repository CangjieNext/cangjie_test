// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Result is 1
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Get <: Command<Int64> {}

main() {
    let w: Int64 = try {
        (perform Get())
    } handle (_: Get) {
        resume with 1
    }
    println("Result is ${w}")
    0
}
