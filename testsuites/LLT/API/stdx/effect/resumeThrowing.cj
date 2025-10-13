// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Hello
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


import stdx.effect.Command

class Get <: Command<String> {}


main() {
    try {
        try {
            try {
                println(perform Get())
            } catch (e: Exception) {
                println(e.message)
            }
        } handle (_: Get) {
            resume throwing Exception("Hello")
        }
    } catch (_: Exception) {
        println("Never")
    }
    0
}
