/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// FuncCallContext 独立构造与属性

/* SCAN
fcc args: 1 obj some: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let a = Constant.create(IntLiteral.get(i32, 0u64)).result
    let fcc = FuncCallContext([a], [i32], Some(i32))
    println("fcc args: ${fcc.args.size} obj some: ${fcc.objType.isSome()}")
}
