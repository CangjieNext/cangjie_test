// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command
import std.collection.*

class Eff <: Command<Int64> {}

main() {
    try {
        try {
            1
        } handle (e: Eff) {
            2
        }
    } handle(e: Eff) {
        3
    }
    0
}
