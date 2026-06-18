/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// createCastToConcrete/Generic, Field*, GetElement*, StoreElement*

/* SCAN
cast: true true
field: true true
get element: true true
store element: true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let pkg = Package("pkg.cb.field", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fld", "fld", "pkg.cb.field")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b = CHIRBuilder(bb)
    let p = fn.parameters[0]

    let ctc = b.createCastToConcrete(p, i64)
    let g = GenericType.get("pkg.cb.field.T", "T")
    let ctg = b.createCastToGeneric(p, g)
    println("cast: ${ctc.targetType == i64} ${ctg.targetType == g}")

    let st = pkg.addStruct("mS", "S")
    st.appendInstanceMemberVar("x", i32)
    let sAlloc = b.createAllocate(st.structType)
    let path = ArrayList<UInt64>()
    path.add(0u64)
    let fd = b.createField(sAlloc.result, path)
    let names = ArrayList<String>()
    names.add("x")
    let fbn = b.createFieldByName(sAlloc.result, names)
    println("field: ${fd.path[0] == 0u64} ${fbn.fieldNames[0] == "x"}")

    let cls = pkg.addClass("mC", "C", true)
    cls.appendInstanceMemberVar("y", i32)
    let cAlloc = b.createAllocate(cls.classType)
    let gNames = ArrayList<String>()
    gNames.add("y")
    let gebn = b.createGetElementByName(cAlloc.result, gNames)
    let ger = b.createGetElementRef(cAlloc.result, path)
    println("get element: ${gebn.fieldNames[0] == "y"} ${ger.path[0] == 0u64}")

    let ser = b.createStoreElementRef(p, sAlloc.result, path)
    let sebn = b.createStoreElementByName(p, sAlloc.result, names)
    println("store element: ${ser.srcValue == p} ${sebn.srcValue == p}")
}
