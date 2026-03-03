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
isExtend: true
isStruct: false
extended is Int32: true
ty equals extendedType: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.kind", AccessLevel.Public)
    let intTy = IntType.getInt32()
    let ext = pkg.addExtend("mExtI32", intTy)

    println("isExtend: ${ext.isExtend()}")
    println("isStruct: ${ext.isStruct()}")
    println("extended is Int32: ${ext.extendedType == intTy}")
    println("ty equals extendedType: ${ext.ty == ext.extendedType}")
}
