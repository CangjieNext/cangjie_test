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
extendDefs: 1
importedExtendDefs: 1
local isImported: false
imported isImported: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.counts", AccessLevel.Public)
    let t = IntType.getInt32()

    pkg.addExtend("locExt", t)
    pkg.addImportedExtend("impExt", "foreign.pkg", t)

    println("extendDefs: ${pkg.extendDefs.size}")
    println("importedExtendDefs: ${pkg.importedExtendDefs.size}")

    println("local isImported: ${pkg.extendDefs[0].isImported()}")
    println("imported isImported: ${pkg.importedExtendDefs[0].isImported()}")
}
