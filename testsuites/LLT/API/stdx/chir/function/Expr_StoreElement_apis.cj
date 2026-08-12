/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// FieldByName、GetElementByName、GetElementRef、StoreElementByName、StoreElementRef

/* SCAN
field by name: x
get elem by name: val
get elem ref path: 0
store elem ref ops: 2
store elem by name ops: 2
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let pkg = Package("pkg.se", AccessLevel.Public)
    let st = pkg.addStruct("mPt", "Point")
    st.appendInstanceMemberVar("x", i32)
    st.appendInstanceMemberVar("y", i64)
    let cls = pkg.addClass("mNode", "Node", true)
    cls.appendInstanceMemberVar("val", i32)

    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "se", "se", "pkg.se")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let p = Constant.create(IntLiteral.get(i32, 1u64)).result

    let sAlloc = Allocate.create(st.structType)
    bb.appendExpr(sAlloc)
    let names = ArrayList<String>()
    names.add("x")
    let fbn = FieldByName.create(sAlloc.result, names)
    bb.appendExpr(fbn)
    println("field by name: ${fbn.fieldNames[0]}")

    let cAlloc = Allocate.create(cls.classType)
    bb.appendExpr(cAlloc)
    let gNames = ArrayList<String>()
    gNames.add("val")
    let gebn = GetElementByName.create(cAlloc.result, gNames)
    bb.appendExpr(gebn)
    println("get elem by name: ${gebn.fieldNames[0]}")

    let path = ArrayList<UInt64>()
    path.add(0u64)
    let ger = GetElementRef.create(sAlloc.result, path)
    bb.appendExpr(ger)
    println("get elem ref path: ${ger.path[0]}")

    let ser = StoreElementRef.create(p, sAlloc.result, path)
    bb.appendExpr(ser)
    println("store elem ref ops: ${ser.operands.size}")

    let sebn = StoreElementByName.create(p, sAlloc.result, names)
    bb.appendExpr(sebn)
    println("store elem by name ops: ${sebn.operands.size}")
}
