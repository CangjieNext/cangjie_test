/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args
// Public IR leftovers: CFunc/varArg, empty enum, empty landing-pad, superClass,
// empty Field path, GetInstantiateValue with no inst types.

import std.collection.*
import stdx.chir.*

main() {
    let pkgName = "pkg.ser59"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()
    let unit = UnitType.get()

    pkg.addEnum("EmptyE", "EmptyE", true)

    let base = pkg.addClass("Base59", "Base59", true)
    let derived = pkg.addClass("Der59", "Der59", true)
    derived.superClass = Some(base.classType)

    let cfnTy = FuncType.get([i32], i32, varArg: true, cFunc: true)
    let fn = pkg.addFunction(cfnTy, "cvar", "cvar", pkgName)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let land = bg.appendBlock()
    land.exceptions = Array<ClassLikeType>()

    let tupEls = ArrayList<Value>()
    tupEls.add(fn.parameters[0])
    let tup = Tuple.create(tupEls)
    bb.appendExpr(tup)
    let emptyPath = ArrayList<UInt64>()
    bb.appendExpr(Field.create(tup.result, emptyPath))

    let instTys = ArrayList<Type>()
    bb.appendExpr(GetInstantiateValue.create(fn, instTys))

    let gT = GenericType.get("${pkgName}.T", "T")
    let ext = pkg.addExtend("Ext59", i32, genericTypeParams: [gT])
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), unit), "Ext59.id", "id", pkgName)
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    ext.appendMethod(mf)

    bb.appendExpr(GoTo.create(land))
    land.appendExpr(Exit.create())

    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    unsafe { freeSerializedMemory() }
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
