/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Function：funcSrcCodeType、selfOrParentIsGeneric、isInstanceMemberMethod（全局函数为 false）

/* SCAN
selfOrGen: true member: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.fs", AccessLevel.Public)
    let ft = FuncType.get(Array<Type>(1, { _ => i32 }), i32)
    let fn = pkg.addFunction(ft, "g", "g", "pkg.fs")
    println("selfOrGen: ${!fn.selfOrParentIsGeneric()} member: ${fn.isInstanceMemberMethod()}")
}
