/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
debug exit inst: true true true
vbuilder: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.misc", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), i32), "g", "g", "pkg.cb.misc")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b = CHIRBuilder(bb)
    let c = b.createConstant(IntLiteral.get(i32, 1u64)).result

    let dbg = b.createDebug(c, "s.cj")
    let ex = b.createExit()
    let giv = b.createGetInstantiateValue(fn, ArrayList<Type>.of([i32]))
    let l = b.createLambda(FuncType.get(Array<Type>(), UnitType.get()), "m", "m")
    println("debug exit inst: ${dbg.srcCodeName == "s.cj"} ${giv.instantiateTypes[0] == i32} ${l.parameters.size == 0 && l.body.entryBlock != bb}")

    let initf = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "initf", "initf", "pkg.cb.misc")
    let vb = b.createVArrayBuilder(VArrayType.get(i32, 2i64), c, c, initf)
    println("vbuilder: ${vb.result.ty == VArrayType.get(i32, 2i64)}")
}
