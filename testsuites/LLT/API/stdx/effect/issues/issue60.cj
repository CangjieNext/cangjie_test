/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// RUN-EXEC: %run %set_stdx_path %output


import stdx.effect.*

class Eff <: Command<Unit> {}
var v: Option<Int64> = None
main() {
    var a = try {
        perform Eff()
        1
    } handle (e: Eff) {
        0
    } finally {
        println("in finally")
        v = Some(0)
    }
    return a + v.getOrThrow()
}

