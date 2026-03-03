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
class str has class kw: true
class str has brace: true
struct str has struct kw: true
struct str has brace: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.ctd.str", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    let st = pkg.addStruct("mS", "S")
    let cs = cls.toString()
    let ss = st.toString()

    println("class str has class kw: ${cs.contains("class")}")
    println("class str has brace: ${cs.contains("{")}")
    println("struct str has struct kw: ${ss.contains("struct")}")
    println("struct str has brace: ${ss.contains("{")}")
}
