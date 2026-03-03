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
class str has class: true
class str has srcCodeName: true
iface str has interface: true
class str has brace: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.str", AccessLevel.Public)
    let cls = pkg.addClass("mC", "MyClass", true)
    let iface = pkg.addClass("mI", "MyIface", false)

    let cs = cls.toString()
    let ifaceStr = iface.toString()
    println("class str has class: ${cs.contains("class")}")
    println("class str has srcCodeName: ${cs.contains("srcCodeName: MyClass")}")
    println("iface str has interface: ${ifaceStr.contains("interface")}")
    println("class str has brace: ${cs.contains("{")}")
}
