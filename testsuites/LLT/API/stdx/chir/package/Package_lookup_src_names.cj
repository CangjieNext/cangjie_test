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
lookup class: LocalClass
lookup struct: LocalStruct
lookup enum: LocalEnum
lookup imported class: ImpClass
lookup imported struct: ImpStruct
lookup imported enum: ImpEnum
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.chir.names"
    let pkg = Package(pkgName, AccessLevel.Public)

    pkg.addClass("mCls", "LocalClass", true)
    pkg.addStruct("mSt", "LocalStruct")
    pkg.addEnum("mEn", "LocalEnum", true)
    let extTy = IntType.getInt32()
    pkg.addImportedClass("iCls", "ImpClass", "foreign.pkg", false)
    pkg.addImportedStruct("iSt", "ImpStruct", "foreign.pkg")
    pkg.addImportedEnum("iEn", "ImpEnum", "foreign.pkg", false)
    pkg.addImportedExtend("iExt", "foreign.pkg", extTy)

    if (let Some(c) <- pkg.getSpecifiedClassDef(pkgName, "LocalClass")) {
        println("lookup class: ${c.srcCodeName}")
    } else {
        println("lookup class: fail")
    }
    if (let Some(s) <- pkg.getSpecifiedStructDef(pkgName, "LocalStruct")) {
        println("lookup struct: ${s.srcCodeName}")
    } else {
        println("lookup struct: fail")
    }
    if (let Some(en) <- pkg.getSpecifiedEnumDef(pkgName, "LocalEnum")) {
        println("lookup enum: ${en.srcCodeName}")
    } else {
        println("lookup enum: fail")
    }

    if (let Some(ic) <- pkg.getSpecifiedClassDef("foreign.pkg", "ImpClass")) {
        println("lookup imported class: ${ic.srcCodeName}")
    } else {
        println("lookup imported class: fail")
    }
    if (let Some(ist) <- pkg.getSpecifiedStructDef("foreign.pkg", "ImpStruct")) {
        println("lookup imported struct: ${ist.srcCodeName}")
    } else {
        println("lookup imported struct: fail")
    }
    if (let Some(ie) <- pkg.getSpecifiedEnumDef("foreign.pkg", "ImpEnum")) {
        println("lookup imported enum: ${ie.srcCodeName}")
    } else {
        println("lookup imported enum: fail")
    }
}
