/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Lambda 公开属性与 destroySelf（含 blockGroups）

/* SCAN
lambda id: Lam
lambda src: Lam
isLocalFunc default: false
isCompileTimeValue default: false
generic params: 1
blockGroups nonempty: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.lam", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get([i32], i32), "host", "host", "pkg.lam")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let gT = GenericType.get("pkg.lam.T", "T")
    let gens = ArrayList<GenericType>()
    gens.add(gT)
    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", gens)
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lamAlloc = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())

    println("lambda id: ${lam.identifier}")
    println("lambda src: ${lam.srcCodeName}")
    println("isLocalFunc default: ${lam.isLocalFunc}")
    println("isCompileTimeValue default: ${lam.isCompileTimeValue}")
    println("generic params: ${lam.genericTypeParams.size}")

    println("blockGroups nonempty: ${lam.blockGroups.size == 1}")
}
