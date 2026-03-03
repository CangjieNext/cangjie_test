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
nullary param count: 0
nullary return is enumType: true
nullary funcType eq get: true
nullary hasVarArg: false
nullary isCFunc: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ctorinfo.ft0", AccessLevel.Public)
    let ex = pkg.addEnum("mColor", "Color", true)

    let nullary = ex.appendEnumCtorInfo("mNone", "None", argTypes: Array<Type>())
    println("nullary param count: ${nullary.funcType.paramTypes.size}")
    println("nullary return is enumType: ${nullary.funcType.returnType == ex.enumType}")
    let ftNull = FuncType.get(Array<Type>(), ex.enumType)
    println("nullary funcType eq get: ${nullary.funcType == ftNull}")
    println("nullary hasVarArg: ${nullary.funcType.hasVarArg}")
    println("nullary isCFunc: ${nullary.funcType.isCFunc}")
}
