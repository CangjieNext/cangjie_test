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
after adds imported: 1 1 1 1
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.imp", AccessLevel.Public)
    let extTy = IntType.getInt32()
    pkg.addImportedClass("iCls", "ImpClass", "foreign.pkg", false)
    pkg.addImportedStruct("iSt", "ImpStruct", "foreign.pkg")
    pkg.addImportedEnum("iEn", "ImpEnum", "foreign.pkg", false)
    pkg.addImportedExtend("iExt", "foreign.pkg", extTy)
    println(
        "after adds imported: ${pkg.importedClassDefs.size} ${pkg.importedStructDefs.size} ${pkg.importedEnumDefs.size} ${pkg.importedExtendDefs.size}"
    )
}
