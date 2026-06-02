/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Spawn、TrySpawn、SpawnBase.needExecuteClosure / executeClosure

/* SCAN
spawn ret: true
tryspawn branches: true
exec need: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.sp", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "c", "c", "pkg.sp")
    callee.initBody()
    let lam = Lambda.create(FuncType.get(Array<Type>(1, { _ => i32 }), UnitType.get()), "Lsp", "Lsp", ArrayList<GenericType>())
    let bg = callee.body.getOrThrow()
    bg.entryBlock.appendExpr(lam)
    let lv = lam.result
    let arg = Constant.create(IntLiteral.get(i32, 0u64)).result
    let sp1 = Spawn.create(UnitType.get(), lv)
    let sp2 = Spawn.create(UnitType.get(), lv, arg)
    println("spawn ret: ${sp1.result.ty == UnitType.get() && sp2.operands.size == 2}")

    let bn = bg.appendBlock()
    let be = bg.appendBlock()
    let ts = TrySpawn.create(UnitType.get(), lv, bn, be)
    let ts2 = TrySpawn.create(UnitType.get(), lv, arg, bn, be)
    println("tryspawn branches: ${ts.normalBranch == bn && ts2.errorBranch == be}")

    sp1.executeClosure = callee
    println("exec need: ${sp1.needExecuteClosure() && sp1.executeClosure == callee}")
}
