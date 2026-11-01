/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Field：Option-like / 普通 enum 选择器、RawArray 元素、非法基类型抛错

/* SCAN
option selector: true
color selector: true
raw elem: true
field invalid: true
fieldByName invalid: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.field.sel", AccessLevel.Public)

    let opt = pkg.addEnum("Opt", "Opt", true)
    opt.appendEnumCtorInfo("Opt.None", "None", argTypes: Array<Type>())
    opt.appendEnumCtorInfo("Opt.Some", "Some", argTypes: [i32])

    let color = pkg.addEnum("Color", "Color", true)
    color.appendEnumCtorInfo("Color.R", "R", argTypes: Array<Type>())
    color.appendEnumCtorInfo("Color.G", "G", argTypes: Array<Type>())
    color.appendEnumCtorInfo("Color.B", "B", argTypes: Array<Type>())

    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.field.sel")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let path0 = ArrayList<UInt64>()
    path0.add(0u64)

    let optAlloc = Allocate.create(opt.enumType)
    bb.appendExpr(optAlloc)
    let fOpt = Field.create(optAlloc.result, path0)
    bb.appendExpr(fOpt)
    println("option selector: ${fOpt.result.ty == BoolType.get()}")

    let colorAlloc = Allocate.create(color.enumType)
    bb.appendExpr(colorAlloc)
    let fColor = Field.create(colorAlloc.result, path0)
    bb.appendExpr(fColor)
    println("color selector: ${fColor.result.ty == IntType.getUInt32()}")

    let ra = RawArrayType.get(i32, 1u32)
    let raAlloc = Allocate.create(ra)
    bb.appendExpr(raAlloc)
    let fRa = Field.create(raAlloc.result, path0)
    bb.appendExpr(fRa)
    println("raw elem: ${fRa.result.ty == i32}")

    var badField = false
    try {
        let c = Constant.create(IntLiteral.get(i32, 1u64))
        bb.appendExpr(c)
        let _ = Field.create(c.result, path0)
    } catch (e: Exception) {
        badField = true
    }
    println("field invalid: ${badField}")

    var badName = false
    try {
        let c2 = Constant.create(IntLiteral.get(i32, 2u64))
        bb.appendExpr(c2)
        let names = ArrayList<String>()
        names.add("x")
        let _ = FieldByName.create(c2.result, names)
    } catch (e: Exception) {
        badName = true
    }
    println("fieldByName invalid: ${badName}")
}
