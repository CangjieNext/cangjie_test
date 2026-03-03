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
struct package ok: true
struct src: Bar
struct id has mS: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.struct.names"
    let pkg = Package(pkgName, AccessLevel.Public)
    let st = pkg.addStruct("mS", "Bar")

    println("struct package ok: ${st.packageName == pkgName}")
    println("struct src: ${st.srcCodeName}")
    println("struct id has mS: ${st.identifier.contains("mS")}")
}
