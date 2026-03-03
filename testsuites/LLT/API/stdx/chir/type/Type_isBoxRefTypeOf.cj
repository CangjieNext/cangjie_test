/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
box ref of i32: true
box ref of bool: false
plain ref not box ref: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let rb = RefType.get(BoxType.get(i32))
    println("box ref of i32: ${rb.isBoxRefTypeOf(i32)}")
    println("box ref of bool: ${rb.isBoxRefTypeOf(BoolType.get())}")
    println("plain ref not box ref: ${RefType.get(i32).isBoxRefTypeOf(i32)}")
}
