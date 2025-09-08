// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command
import std.collection.*

class Yield <: Command<Int64>{}

main() {
    try {
        let a = perform Yield()
        println("it is resumed, a = ${a}")
    } handle(e: Yield) {
        println("it is performed")
        resume with 9
    }
    0 
}
