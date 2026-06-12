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
class package ok: true
class src: Foo
class id has mC: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.class.names"
    let pkg = Package(pkgName, AccessLevel.Public)
    let cls = pkg.addClass("mC", "Foo", true)

    println("class package ok: ${cls.packageName == pkgName}")
    println("class src: ${cls.srcCodeName}")
    println("class id has mC: ${cls.identifier.contains("mC")}")
}
