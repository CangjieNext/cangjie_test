// EXEC: %compiler %cmp_opt --int-overflow=wrapping --static %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success

main() {
    try {
        throw Exception()
    } catch (e: Exception) {
        println("success")
    }
}