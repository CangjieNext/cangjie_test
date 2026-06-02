/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Function：moveBodyTo、setOpen、isDeclaredInCurPackage、funcType、genericTypeParams

/* SCAN
open generic: true false
move body: true
declared cur: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.mv", AccessLevel.Public)
    let u = UnitType.get()
    let a = pkg.addFunction(FuncType.get(Array<Type>(), u), "fa", "fa", "pkg.mv")
    let b = pkg.addFunction(FuncType.get(Array<Type>(), u), "fb", "fb", "pkg.mv")
    a.initBody()
    a.setOpen(true)
    println("open generic: ${a.isOpen()} ${a.isGeneric()}")
    a.moveBodyTo(b)
    println("move body: ${b.body.isSome() && a.body.isNone()}")
    println("declared cur: ${b.isDeclaredInCurPackage()}")
}
