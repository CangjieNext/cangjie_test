/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command
import std.collection.*

class Yield <: Command<(Int64) -> Any> {}

main() {
    try {
        let a = perform Yield()
        println("it is resumed")
        a(9)
    } handle(e: Yield) {
        println("it is performed")
        resume with {x: Int64 => println("x = ${x}")}
    }
    0 
}
