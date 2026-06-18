/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 多种 Expression 子类 operator==（refEq）与 Unary BitNot

/* SCAN
refEq batch: true true true true true true true true true
bitnot ok: true
*/

import std.collection.*
import stdx.chir.*
import stdx.chir.Box as BoxExpr

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.refeq", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "refeq", "refeq", "pkg.refeq")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let v = Constant.create(IntLiteral.get(i32, 1u64)).result

    let alloc = Allocate.create(i32)
    bb.appendExpr(alloc)
    let ld = Load.create(alloc.result)
    bb.appendExpr(ld)
    let st = Store.create(v, alloc.result)
    bb.appendExpr(st)
    let dbg = Debug.create(v, "d")
    bb.appendExpr(dbg)
    let tup = Tuple.create(ArrayList<Value>([v]))
    bb.appendExpr(tup)
    let bx = BoxExpr.create(v, RefType.get(i32))
    bb.appendExpr(bx)
    let nc = NumericCast.create(v, IntType.getInt64(), OverflowStrategy.NA)
    bb.appendExpr(nc)
  let bitnot = UnaryExpression.create(UnaryExprKind.BitNot, v)
    bb.appendExpr(bitnot)
    let ex = Exit.create()
    bb.appendExpr(ex)

    let ok = alloc == alloc && ld == ld && st == st && dbg == dbg && tup == tup && bx == bx && nc == nc && bitnot == bitnot && ex == ex
    println("refEq batch: ${ok} ${alloc == alloc} ${ld == ld} ${st == st} ${dbg == dbg} ${tup == tup} ${bx == bx} ${nc == nc} ${bitnot == bitnot}")
    println("bitnot ok: ${bitnot.toString().contains("BitNot")}")
}
