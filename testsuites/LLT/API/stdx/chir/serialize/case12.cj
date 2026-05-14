/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// Tuple, Field, FieldByName, GetElementRef, GetElementByName

main() {
    let pkg = Package("pkg.ser12", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // StructDef for FieldByName
    let st = pkg.addStruct("mVec2", "Vec2")
    st.appendInstanceMemberVar("x", i32)
    st.appendInstanceMemberVar("y", i64)

    // ClassDef for GetElementByName
    let cls = pkg.addClass("mNode", "Node", true)
    cls.appendInstanceMemberVar("val", i32)
    cls.appendInstanceMemberVar("next", i64)

    // fn1: Tuple + Field + FieldByName (on struct value)
    let fn1 = pkg.addFunction(FuncType.get([i32, i64], UnitType.get()), "fn1", "fn1", "pkg.ser12")
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let p0 = fn1.parameters[0]
    let p1 = fn1.parameters[1]

    let els = ArrayList<Value>()
    els.add(p0)
    els.add(p1)
    let tup = Tuple.create(els)
    bb1.appendExpr(tup)

    let path0 = ArrayList<UInt64>()
    path0.add(0u64)
    let fd0 = Field.create(tup.result, path0)
    bb1.appendExpr(fd0)

    let path1 = ArrayList<UInt64>()
    path1.add(1u64)
    let fd1 = Field.create(tup.result, path1)
    bb1.appendExpr(fd1)

    // Allocate a struct value and use FieldByName on it
    let alloc1 = Allocate.create(st.structType)
    bb1.appendExpr(alloc1)
    let names = ArrayList<String>()
    names.add("x")
    let fbn = FieldByName.create(alloc1.result, names)
    bb1.appendExpr(fbn)

    bb1.appendExpr(Exit.create())

    // fn2: GetElementRef (on struct), GetElementByName (on class value)
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn2", "fn2", "pkg.ser12")
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock

    let alloc2 = Allocate.create(st.structType)
    bb2.appendExpr(alloc2)

    let refPath = ArrayList<UInt64>()
    refPath.add(0u64)
    let ger = GetElementRef.create(alloc2.result, refPath)
    bb2.appendExpr(ger)

    let alloc3 = Allocate.create(cls.classType)
    bb2.appendExpr(alloc3)
    let nameList = ArrayList<String>()
    nameList.add("val")
    let gebn = GetElementByName.create(alloc3.result, nameList)
    bb2.appendExpr(gebn)

    bb2.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
