/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GetInstantiateValue：成员方法 + 类/方法泛型经 calculateFunctionInstType

/* SCAN
member inst ret: true
global func inst: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let bl = BoolType.get()
    let pkg = Package("pkg.giv.mg", AccessLevel.Public)
    let gT = GenericType.get("pkg.giv.mg.T", "T")
    let gU = GenericType.get("pkg.giv.mg.U", "U")

    let box = pkg.addClass("Box", "Box", true, genericTypeParams: [gT])
    let mf = pkg.addFunction(FuncType.get([box.classType], gU), "Box.get", "get", "pkg.giv.mg")
    mf.genericTypeParams = [gU]
    box.appendMethod(mf)

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.giv.mg")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock

    let giv = GetInstantiateValue.create(mf, ArrayList<Type>.of([i32, bl]))
    bb.appendExpr(giv)
    let ft = (giv.result.ty as FuncType).getOrThrow()
    println("member inst ret: ${ft.returnType == bl && ft.paramTypes[0] == ClassLikeType.get(box, [i32])}")

    let gid = pkg.addFunction(FuncType.get([gT], gT), "id", "id", "pkg.giv.mg")
    gid.genericTypeParams = [gT]
    let giv2 = GetInstantiateValue.create(gid, ArrayList<Type>.of([i32]))
    bb.appendExpr(giv2)
    let ft2 = (giv2.result.ty as FuncType).getOrThrow()
    println("global func inst: ${ft2.returnType == i32 && ft2.paramTypes[0] == i32}")
}
