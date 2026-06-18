/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CastToConcrete、CastToGeneric

/* SCAN
cast concrete tgt: Int64
cast generic tgt: Generic-pkg.ctg.T
refEq concrete: true
refEq generic: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let pkg = Package("pkg.ctg", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ctg", "ctg", "pkg.ctg")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let v = Constant.create(IntLiteral.get(i32, 3u64)).result

    let ctc = CastToConcrete.create(v, i64)
    bb.appendExpr(ctc)
    println("cast concrete tgt: ${ctc.targetType.toString()}")

    let gT = GenericType.get("pkg.ctg.T", "T")
    let ctg = CastToGeneric.create(v, gT)
    bb.appendExpr(ctg)
    println("cast generic tgt: ${ctg.targetType.toString()}")

    println("refEq concrete: ${ctc == ctc}")
    println("refEq generic: ${ctg == ctg}")
}
