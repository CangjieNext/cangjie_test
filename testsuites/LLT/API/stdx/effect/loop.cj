/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Done 100 iterations
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command
import std.collection.*

class Eff <: Command<() -> Unit> {}

main() {
    let counter = Box(0)
    try {
        let a = perform Eff()
        a()
    } handle (e: Eff) {
        println("handling")
        if (counter.value < 100) {
            counter.value += 1
            resume with { =>
                let a = perform Eff()
                a()
            }
        } else {
            println("Returning")
        }
    }
    println("Done ${counter.value} iterations")
}
