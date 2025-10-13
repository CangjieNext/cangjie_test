// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Get <: Command<Int64> {}

main() {
    try {
        try {
            1
        } catch (e: Exception) {
            println("Never")
        }
    } handle (_: Get) {
        resume with 1
    }
    0
}
