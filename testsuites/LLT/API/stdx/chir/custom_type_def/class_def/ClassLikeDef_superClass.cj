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
sub super initially none: true
sub super equals base: true
sub super cleared: true
sub super reattached: true
mid super equals base: true
leaf super equals mid: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.super", AccessLevel.Public)
    let base = pkg.addClass("Base", "Base", true)
    let mid = pkg.addClass("Mid", "Mid", true)
    let leaf = pkg.addClass("Leaf", "Leaf", true)
    let sub = pkg.addClass("Sub", "Sub", true)

    println("sub super initially none: ${sub.superClass.isNone()}")

    sub.superClass = Some(base.classType)
    let eqBase = sub.superClass.isSome() && sub.superClass.getOrThrow() == base.classType
    println("sub super equals base: ${eqBase}")

    sub.superClass = None
    println("sub super cleared: ${sub.superClass.isNone()}")

    sub.superClass = Some(base.classType)
    println("sub super reattached: ${sub.superClass.getOrThrow() == base.classType}")

    mid.superClass = Some(base.classType)
    println("mid super equals base: ${mid.superClass.getOrThrow() == base.classType}")

    leaf.superClass = Some(mid.classType)
    println("leaf super equals mid: ${leaf.superClass.getOrThrow() == mid.classType}")
}
