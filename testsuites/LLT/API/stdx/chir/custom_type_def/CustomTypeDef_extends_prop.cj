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
class extends default: 0
struct extends default: 0
struct extends after empty: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.ctd.ext", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    let st = pkg.addStruct("mS", "S")

    println("class extends default: ${cls.extends.size}")
    println("struct extends default: ${st.extends.size}")

    st.extends = Array<ExtendDef>()
    println("struct extends after empty: ${st.extends.size}")
}
