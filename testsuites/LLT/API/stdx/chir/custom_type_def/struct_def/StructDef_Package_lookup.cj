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
pkg structDefs: 1
pkg importedStructDefs: 1
lookup local: Point
lookup imported: ImpSt
struct eq: true
imported isImported: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.struct.lookup"
    let pkg = Package(pkgName, AccessLevel.Internal)

    let local = pkg.addStruct("mS", "Point")
    pkg.addImportedStruct("iS", "ImpSt", "foreign.pkg")

    println("pkg structDefs: ${pkg.structDefs.size}")
    println("pkg importedStructDefs: ${pkg.importedStructDefs.size}")

    if (let Some(s) <- pkg.getSpecifiedStructDef(pkgName, "Point")) {
        println("lookup local: ${s.srcCodeName}")
    } else {
        println("lookup local: fail")
    }
    if (let Some(ims) <- pkg.getSpecifiedStructDef("foreign.pkg", "ImpSt")) {
        println("lookup imported: ${ims.srcCodeName}")
    } else {
        println("lookup imported: fail")
    }

    if (let Some(again) <- pkg.getSpecifiedStructDef(pkgName, "Point")) {
        println("struct eq: ${again == local}")
    } else {
        println("struct eq: false")
    }

    if (let Some(imp) <- pkg.getSpecifiedStructDef("foreign.pkg", "ImpSt")) {
        println("imported isImported: ${imp.isImported()}")
    } else {
        println("imported isImported: false")
    }
}
