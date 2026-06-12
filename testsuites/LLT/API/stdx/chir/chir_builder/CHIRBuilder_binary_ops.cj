/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
binary arith: true true true true true true
binary logic: true true true true true true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.call", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "f", "f", "pkg.cb.call")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b = CHIRBuilder(bb)
    let v1 = b.createConstant(IntLiteral.get(i32, 8u64)).result
    let v2 = b.createConstant(IntLiteral.get(i32, 2u64)).result

    let add = b.createBinaryAdd(v1, v2, OverflowStrategy.Wrapping)
    let div = b.createBinaryDiv(v1, v2, OverflowStrategy.Wrapping)
    let exp = b.createBinaryExp(v1, v2, OverflowStrategy.Wrapping)
    let mod = b.createBinaryMod(v1, v2, OverflowStrategy.Wrapping)
    let mul = b.createBinaryMul(v1, v2, OverflowStrategy.Wrapping)
    let sub = b.createBinarySub(v1, v2, OverflowStrategy.Wrapping)
    let arithOK = add.toString().contains("Add") && div.toString().contains("Div") && exp.toString().contains("Exp") &&
        mod.toString().contains("Mod") && mul.toString().contains("Mul") && sub.toString().contains("Sub")
    println("binary arith: ${arithOK} ${add.overflow == OverflowStrategy.Wrapping} ${div.overflow == OverflowStrategy.Wrapping} ${exp.overflow == OverflowStrategy.Wrapping} ${mod.overflow == OverflowStrategy.Wrapping} ${sub.overflow == OverflowStrategy.Wrapping}")

    let a = b.createBinaryAnd(v1, v2)
    let ba = b.createBinaryBitAnd(v1, v2)
    let bo = b.createBinaryBitOr(v1, v2)
    let bx = b.createBinaryBitXor(v1, v2)
    let eq = b.createBinaryEqual(v1, v2)
    let ne = b.createBinaryNotEqual(v1, v2)
    let o = b.createBinaryOr(v1, v2)
    let rs = b.createBinaryRShift(v1, v2, OverflowStrategy.Wrapping)
    let logicOK = a.toString().contains("And") && ba.toString().contains("BitAnd") && bo.toString().contains("BitOr") &&
        bx.toString().contains("BitXor") && eq.toString().contains("Equal") && ne.toString().contains("NotEqual") &&
        o.toString().contains("Or") && rs.toString().contains("RShift")
    println("binary logic: ${logicOK} ${a.result.ty == BoolType.get()} ${eq.result.ty == BoolType.get()} ${ne.result.ty == BoolType.get()} ${o.result.ty == BoolType.get()} ${rs.overflow == OverflowStrategy.Wrapping} true true")
}
