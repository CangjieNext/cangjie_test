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
def eq lookup class: true
def eq lookup struct: true
def eq lookup enum: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.chir.eq"
    let pkg = Package(pkgName, AccessLevel.Public)

    let localClass = pkg.addClass("mCls", "LocalClass", true)
    let localStruct = pkg.addStruct("mSt", "LocalStruct")
    let localEnum = pkg.addEnum("mEn", "LocalEnum", true)

    if (let Some(c) <- pkg.getSpecifiedClassDef(pkgName, "LocalClass")) {
        println("def eq lookup class: ${c == localClass}")
    } else {
        println("def eq lookup class: false")
    }
    if (let Some(s) <- pkg.getSpecifiedStructDef(pkgName, "LocalStruct")) {
        println("def eq lookup struct: ${s == localStruct}")
    } else {
        println("def eq lookup struct: false")
    }
    if (let Some(en) <- pkg.getSpecifiedEnumDef(pkgName, "LocalEnum")) {
        println("def eq lookup enum: ${en == localEnum}")
    } else {
        println("def eq lookup enum: false")
    }
}
