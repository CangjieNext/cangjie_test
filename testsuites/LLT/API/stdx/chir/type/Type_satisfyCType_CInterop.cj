/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CString / CPointer / C 函数类型 等显式 C 互操作类型

/* SCAN
cstr satisfyC: true
cp i32 satisfyC: true
cfunc satisfyC: true
plain func satisfyC: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()

    println("cstr satisfyC: ${CStringType.get().satisfyCType()}")
    println("cp i32 satisfyC: ${CPointerType.get(i32).satisfyCType()}")

    let cfn = FuncType.get(Array<Type>(1, { _ => i32 }), i32, cFunc: true)
    let plain = FuncType.get(Array<Type>(1, { _ => i32 }), i32)
    println("cfunc satisfyC: ${cfn.satisfyCType()}")
    println("plain func satisfyC: ${plain.satisfyCType()}")
}
