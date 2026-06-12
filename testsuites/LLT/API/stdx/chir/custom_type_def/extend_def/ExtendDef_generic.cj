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
generic extend isGeneric: true
generic param count: 1
generic param toString: Generic-geT
extended still Int32: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.gen", AccessLevel.Public)
    let intTy = IntType.getInt32()
    let g = GenericType.get("geT", "E")
    let gp = Array<GenericType>(1, { _ => g })
    let ext = pkg.addExtend("gExt", intTy, genericTypeParams: gp)

    println("generic extend isGeneric: ${ext.isGeneric()}")
    println("generic param count: ${ext.genericTypeParams.size}")
    println("generic param toString: ${ext.genericTypeParams[0].toString()}")
    println("extended still Int32: ${ext.extendedType == intTy}")
}
