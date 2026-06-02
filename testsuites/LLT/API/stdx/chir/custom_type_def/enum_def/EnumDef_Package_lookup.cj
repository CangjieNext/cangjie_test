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
pkg enumDefs: 1
pkg importedEnumDefs: 1
lookup local enum: Color
lookup imported enum: ImpEn
enum eq: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.enum.lookup"
    let pkg = Package(pkgName, AccessLevel.Internal)

    let localEnum = pkg.addEnum("mEx", "Color", true)
    pkg.addImportedEnum("iEn", "ImpEn", "foreign.pkg", true)

    println("pkg enumDefs: ${pkg.enumDefs.size}")
    println("pkg importedEnumDefs: ${pkg.importedEnumDefs.size}")

    if (let Some(e) <- pkg.getSpecifiedEnumDef(pkgName, "Color")) {
        println("lookup local enum: ${e.srcCodeName}")
    } else {
        println("lookup local enum: fail")
    }
    if (let Some(ie) <- pkg.getSpecifiedEnumDef("foreign.pkg", "ImpEn")) {
        println("lookup imported enum: ${ie.srcCodeName}")
    } else {
        println("lookup imported enum: fail")
    }

    if (let Some(again) <- pkg.getSpecifiedEnumDef(pkgName, "Color")) {
        println("enum eq: ${again == localEnum}")
    } else {
        println("enum eq: false")
    }
}
