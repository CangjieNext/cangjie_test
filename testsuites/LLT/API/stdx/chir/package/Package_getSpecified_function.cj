/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Package.getSpecifiedFunction：命中 / 未命中 / 空列表

/* SCAN
empty miss: true
hit eq: true
miss other: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.chir.gspec.fn"
    let emptyPkg = Package("pkg.chir.gspec.fn.empty", AccessLevel.Public)
    println("empty miss: ${emptyPkg.getSpecifiedFunction("none").isNone()}")

    let pkg = Package(pkgName, AccessLevel.Public)
    let ft = FuncType.get(Array<Type>(), UnitType.get())
    let fn = pkg.addFunction(ft, "foo", "bar", pkgName)

    if (let Some(got) <- pkg.getSpecifiedFunction("foo")) {
        println("hit eq: ${got == fn}")
    } else {
        println("hit eq: false")
    }
    println("miss other: ${pkg.getSpecifiedFunction("bar").isNone()}")
}
