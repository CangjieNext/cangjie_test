/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GenericType.upperBounds：拒绝值类型上界

/* SCAN
gen ub value throw: true
*/

import stdx.chir.*

main() {
    let g = GenericType.get("gBadUb", "Tv")
    var threw = false
    try {
        g.upperBounds = [IntType.getInt32()]
    } catch (e: IllegalArgumentException) {
        threw = true
    }
    println("gen ub value throw: ${threw}")
}
