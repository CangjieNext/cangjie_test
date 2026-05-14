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

// 同一 Package 中 ClassDef + StructDef + EnumDef + ExtendDef 共存

main() {
    let pkg = Package("pkg.td17", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // ClassDef
    let cls = pkg.addClass("mAnimal", "Animal", true)
    cls.appendInstanceMemberVar("age", i32)
    let mfCls = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mAnimal.getAge", "getAge", "pkg.td17")
    mfCls.initBody()
    mfCls.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mfCls)

    // StructDef
    let st = pkg.addStruct("mPoint", "Point")
    st.appendInstanceMemberVar("x", i32)
    st.appendInstanceMemberVar("y", i32)
    let mfSt = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mPoint.getX", "getX", "pkg.td17")
    mfSt.initBody()
    mfSt.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    st.appendMethod(mfSt)

    // EnumDef
    let en = pkg.addEnum("mColor", "Color", true)
    en.appendEnumCtorInfo("mColor.Red", "Red", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mColor.Green", "Green", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mColor.Blue", "Blue", argTypes: Array<Type>())
    let mfEn = pkg.addFunction(FuncType.get(Array<Type>(), BoolType.get()), "mColor.isRed", "isRed", "pkg.td17")
    mfEn.initBody()
    mfEn.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    en.appendMethod(mfEn)

    // ExtendDef
    let ext = pkg.addExtend("mExtPoint", st.structType)
    let mfExt = pkg.addFunction(FuncType.get(Array<Type>(), i64), "mExtPoint.toId", "toId", "pkg.td17")
    mfExt.initBody()
    mfExt.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    ext.appendMethod(mfExt)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
