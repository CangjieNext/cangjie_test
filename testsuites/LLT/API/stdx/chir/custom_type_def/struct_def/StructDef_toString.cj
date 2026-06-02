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
struct str has struct: true
struct str has isCStruct: true
struct str has brace: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.str", AccessLevel.Public)
    let s1 = pkg.addStruct("mS", "S")

    let ss = s1.toString()
    println("struct str has struct: ${ss.contains("struct")}")
    println("struct str has isCStruct: ${ss.contains("isCStruct")}")
    println("struct str has brace: ${ss.contains("{")}")
}
