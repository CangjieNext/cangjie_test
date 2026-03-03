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
lookup class miss: true
lookup struct miss: true
lookup enum miss: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.miss", AccessLevel.Public)
    println("lookup class miss: ${pkg.getSpecifiedClassDef("not.a.pkg", "NoSuch").isNone()}")
    println("lookup struct miss: ${pkg.getSpecifiedStructDef("not.a.pkg", "NoSuch").isNone()}")
    println("lookup enum miss: ${pkg.getSpecifiedEnumDef("not.a.pkg", "NoSuch").isNone()}")
}
