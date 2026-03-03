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
initial abstract open sealed: false false false
after abstract: true true false
abstract off: false false false
after open: false true false
open off: false false false
after sealed: false false true
sealed off: false false false
abstract implies open: true true false
clear abstract: false false false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.attr", AccessLevel.Public)
    let c = pkg.addClass("C", "C", true)

    println(
        "initial abstract open sealed: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}"
    )

    c.setAbstract(true)
    println("after abstract: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setAbstract(false)
    println("abstract off: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setOpen(true)
    println("after open: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setOpen(false)
    println("open off: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setSealed(true)
    println("after sealed: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setSealed(false)
    println("sealed off: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setAbstract(true)
    println("abstract implies open: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")

    c.setAbstract(false)
    println("clear abstract: ${c.isAbstract()} ${c.isOpen()} ${c.isSealed()}")
}
