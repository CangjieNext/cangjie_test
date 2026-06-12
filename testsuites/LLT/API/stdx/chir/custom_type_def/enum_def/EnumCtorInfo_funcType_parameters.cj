/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
one srcCodeName: One
one param count: 1
one param0 kind: Int32
one return is enumType: true
one funcType eq get: true
one funcType ne nullary: true
two param count: 2
two func str has Arrow: true
constructors total: 3
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ctorinfo.ftn", AccessLevel.Public)
    let ex = pkg.addEnum("mColor", "Color", true)

    ex.appendEnumCtorInfo("mNone", "None", argTypes: Array<Type>())
    let ftNull = FuncType.get(Array<Type>(), ex.enumType)

    let oneArg = Array<Type>(1, { _ => IntType.getInt32() })
    let one = ex.appendEnumCtorInfo("mOne", "One", argTypes: oneArg)
    println("one srcCodeName: ${one.srcCodeName}")
    println("one param count: ${one.funcType.paramTypes.size}")
    println("one param0 kind: ${one.funcType.paramTypes[0].toString()}")
    println("one return is enumType: ${one.funcType.returnType == ex.enumType}")
    let ftOne = FuncType.get(oneArg, ex.enumType)
    println("one funcType eq get: ${one.funcType == ftOne}")
    println("one funcType ne nullary: ${one.funcType != ftNull}")

    let twoArg = Array<Type>(2, { _ => IntType.getInt32() })
    let two = ex.appendEnumCtorInfo("mRgb", "Rgb", argTypes: twoArg)
    println("two param count: ${two.funcType.paramTypes.size}")
    let fts = two.funcType.toString()
    println("two func str has Arrow: ${fts.contains(" -> ")}")
    println("constructors total: ${ex.constructors.size}")
}
