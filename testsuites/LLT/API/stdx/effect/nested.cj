// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Toplevel
// ASSERT: scan Nested
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Eff <: Command<Int64> {
    Eff() {}
}

main() {
    let x = try {
        perform Eff()
        try{
            perform Eff()
        } handle(e: Eff) {
            println("Nested")
            resume with 0
        }
    } handle(e: Eff) {
        println("Toplevel")
        resume with 0
    }
    0
}
