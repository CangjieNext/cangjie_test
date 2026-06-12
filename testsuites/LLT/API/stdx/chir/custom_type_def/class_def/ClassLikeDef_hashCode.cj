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
class hash stable: true
class hash eq id hash: true
cls iface hash differ: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.hash", AccessLevel.Public)
    let cls = pkg.addClass("mC", "MyClass", true)
    let iface = pkg.addClass("mI", "MyIface", false)
    let h1 = cls.hashCode()
    let h2 = cls.hashCode()

    println("class hash stable: ${h1 == h2}")
    println("class hash eq id hash: ${cls.hashCode() == cls.identifier.hashCode()}")
    println("cls iface hash differ: ${cls.hashCode() != iface.hashCode()}")
}
