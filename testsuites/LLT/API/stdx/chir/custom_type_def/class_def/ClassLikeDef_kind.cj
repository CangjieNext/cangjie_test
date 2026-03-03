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
cls isClass: true
cls isInterface: false
iface isClass: false
iface isInterface: true
cls isEnum: false
cls isClassLike: true
iface isClassLike: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.kind", AccessLevel.Public)
    let cls = pkg.addClass("mCls", "MyClass", true)
    let iface = pkg.addClass("mIface", "MyIface", false)

    println("cls isClass: ${cls.isClass()}")
    println("cls isInterface: ${cls.isInterface()}")
    println("iface isClass: ${iface.isClass()}")
    println("iface isInterface: ${iface.isInterface()}")
    println("cls isEnum: ${cls.isEnum()}")
    println("cls isClassLike: ${cls.isClassLike()}")
    println("iface isClassLike: ${iface.isClassLike()}")
}
