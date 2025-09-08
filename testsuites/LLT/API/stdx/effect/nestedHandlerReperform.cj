// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Handling Eff 1
// ASSERT: scan Handling Eff 2
// ASSERT: scan Handling Eff 3
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Eff <: Command<Unit> {}

main() {
    try {
        try{
            perform Eff()
            println("Handling Eff 3")
        } handle(e: Eff) {
            println("Handling Eff 1")
            perform e
            resume
        }
    } handle(e: Eff) {
        println("Handling Eff 2")
        resume
    }
    0
}
