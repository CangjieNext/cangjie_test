/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// refEq：Field / Get* / Load / Store* / InstanceOf / RTTI 等

/* SCAN
refEq memory: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let pkg = Package("pkg.refeq.mem", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.refeq.mem")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let fn = pkg.addFunction(FuncType.get([i32], UnitType.get()), "host", "host", "pkg.refeq.mem")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let c = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(c)
    let v = c.result

    let st = pkg.addStruct("mPt", "Point")
    st.appendInstanceMemberVar("x", i32)
    let sAlloc = Allocate.create(st.structType)
    bb.appendExpr(sAlloc)
    let names = ArrayList<String>()
    names.add("x")
    let path = ArrayList<UInt64>()
    path.add(0u64)
    let sebn = StoreElementByName.create(v, sAlloc.result, names)
    bb.appendExpr(sebn)
    let ser = StoreElementRef.create(v, sAlloc.result, path)
    bb.appendExpr(ser)
    let tup = Tuple.create(ArrayList<Value>.of([v, v]))
    bb.appendExpr(tup)
    let fd = Field.create(tup.result, path)
    bb.appendExpr(fd)
    let fbn = FieldByName.create(sAlloc.result, names)
    bb.appendExpr(fbn)
    let cls = pkg.addClass("mNode", "Node", true)
    cls.appendInstanceMemberVar("val", i32)
    let cAlloc = Allocate.create(cls.classType)
    bb.appendExpr(cAlloc)
    let gNames = ArrayList<String>()
    gNames.add("val")
    let gebn = GetElementByName.create(cAlloc.result, gNames)
    bb.appendExpr(gebn)
    let ger = GetElementRef.create(sAlloc.result, path)
    bb.appendExpr(ger)
    let ge = GetException.create(i32)
    bb.appendExpr(ge)
    let giv = GetInstantiateValue.create(callee, ArrayList<Type>.of([i32]))
    bb.appendExpr(giv)
    let gr = GetRTTI.create(v)
    bb.appendExpr(gr)
    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)
    let iof = InstanceOf.create(v, i64)
    bb.appendExpr(iof)
    let ld = Load.create(sAlloc.result)
    bb.appendExpr(ld)
    let alloc = Allocate.create(i32)
    bb.appendExpr(alloc)

    let ok = fd == fd && fbn == fbn && gebn == gebn && ger == ger && ge == ge &&
        giv == giv && gr == gr && gs == gs && iof == iof && ld == ld &&
        sebn == sebn && ser == ser && alloc == alloc && c == c
    println("refEq memory: ${ok}")
    bb.appendExpr(Exit.create())
}
