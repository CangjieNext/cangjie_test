/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Handling Eff
// ASSERT: scan Handling Eff1
// ASSERT: scan Handling Eff
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command
import std.collection.*

class Eff <: Command<Int64> {}
class Eff1 <: Command<Int64> {}

main() {
    let _ = try {
        perform Eff()
        try{
            perform Eff()
            perform Eff1()
            perform Eff()
        } handle(e: Eff1) {
            println("Handling Eff1")
            perform Eff()
        }
    } handle(e: Eff) {
        println("Handling Eff")
        resume with Int64(6)
    }
    0
}
