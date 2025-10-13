// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Hello
// ASSERT: scan-not Never
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Get <: Command<Int64> {}

main() {
    try {
        try {
            try {
                perform Get()
            } catch (e: Exception) {
                println("Never: " + e.message)
            }
            ()
        } handle (_: Get) {
            throw Exception("Hello")

            resume with 1
        }
    } catch (e: Exception) {
        println(e.message)
    }
    0
}
