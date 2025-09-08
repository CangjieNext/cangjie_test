// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Hello World!
// ASSERT: scan-not Never
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Get <: Command<Int64> {}
class Eff <: Command<Unit> {}

main() {
    let x = try {
        perform Get()
        "Never"
    } handle (_: Get) {
        "World!"
    }
    println("Hello ${x}")
    0
}
