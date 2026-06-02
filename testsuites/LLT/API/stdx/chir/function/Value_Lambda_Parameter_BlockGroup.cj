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
func id: true
param ty i32: true
param nonempty: true
blocks: 2
func blockGroups: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.lpr", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "Lpr", "srcPr", "pkg.lpr")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let p0 = fn.parameters[0]
    bg.appendBlock()
    println("func id: ${fn.identifier.contains("Lpr") && fn.srcCodeName == "srcPr"}")
    println("param ty i32: ${p0.ty == i32}")
    println("param nonempty: ${p0.toString() != String.empty}")
    println("blocks: ${bg.blocks.size}")
    println("func blockGroups: ${fn.body.isSome()}")
}
