// EXEC: %compiler %cmp_opt --int-overflow=wrapping --static %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-1 An exception has occurred:

main() {
    throw Exception()
}