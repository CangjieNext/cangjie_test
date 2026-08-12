/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// createAllocate / Load / Store / TryAllocate / RawArray* / TryRawArrayAllocate / Tuple / VArray

/* SCAN
alloc load store: true true true
try alloc: true
raw array: true true true
try raw: true
tuple varray: true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.mem", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "mem", "mem", "pkg.cb.mem")
    fn.initBody()
    let body = fn.body.getOrThrow()
    let bb = body.entryBlock
    let bn = body.appendBlock()
    let be = body.appendBlock()
    let b = CHIRBuilder(bb)

    let alloc = b.createAllocate(i32)
    let ld = b.createLoad(alloc.result)
    let st = b.createStore(ld.result, alloc.result)
    println("alloc load store: ${alloc.allocatedType == i32} ${ld.result.ty == i32} ${st.srcValue == ld.result}")

    let ta = b.createTryAllocate(i32, bn, be)
    println("try alloc: ${ta.normalBranch == bn && ta.errorBranch == be}")

    let sz = b.createConstant(IntLiteral.get(i32, 2u64)).result
    let ra = b.createRawArrayAllocate(i32, sz)
    let iv = b.createConstant(IntLiteral.get(i32, 0u64)).result
    let riv = b.createRawArrayInitByValue(ra.result, sz, iv)
    let els = ArrayList<Value>()
    els.add(b.createConstant(IntLiteral.get(i32, 1u64)).result)
    let rli = b.createRawArrayLiteralInit(ra.result, els)
    println("raw array: ${ra.elementType == i32} ${riv.operands.size == 3} ${rli.operands.size >= 2}")

    let tra = b.createTryRawArrayAllocate(i32, sz, bn, be)
    println("try raw: ${tra.errorBranch == be}")

    let a = b.createConstant(IntLiteral.get(i32, 1u64)).result
    let c = b.createConstant(IntLiteral.get(i32, 2u64)).result
    let tup = b.createTuple([a, c])
    let ve = ArrayList<Value>()
    ve.add(a)
    let va = b.createVArray(ve)
    println("tuple varray: ${tup.elements.size == 2} ${va.result.ty.isVArrayType()}")
}
