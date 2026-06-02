/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Package 暂无 getSpecifiedExtendDef；addImportedExtend 后校验 packageName、extendedType 与 importedExtendDefs 一致

/* SCAN
imported extend pkg and ty: true
imported extend in list: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.gsxt", AccessLevel.Public)
    let foreignPkg = "foreign.pkg.spec.ext"
    let i32 = IntType.getInt32()
    let ext = pkg.addImportedExtend("iExtSpec", foreignPkg, i32)

    println("imported extend pkg and ty: ${ext.packageName == foreignPkg && ext.extendedType == i32}")

    var inList = false
    for (d in pkg.importedExtendDefs) {
        if (d.identifier == ext.identifier) {
            inList = true
        }
    }
    println("imported extend in list: ${inList}")
}
