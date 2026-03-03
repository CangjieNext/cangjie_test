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
class hash twice eq: true
struct hash twice eq: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.ctd.hash", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    let st = pkg.addStruct("mS", "S")
    let hc1 = cls.hashCode()
    let hc2 = cls.hashCode()
    let hs1 = st.hashCode()
    let hs2 = st.hashCode()

    println("class hash twice eq: ${hc1 == hc2}")
    println("struct hash twice eq: ${hs1 == hs2}")
}
