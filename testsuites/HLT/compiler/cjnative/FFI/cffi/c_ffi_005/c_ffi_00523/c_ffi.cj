/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign func testfunc1(a: CType): CType

foreign func testfunc2(a: CType, b: CType): CType

foreign func testfunc3(a!: CType, b!: CType): CType

foreign func testfunc4(a!: CType = 10, b!: CType = 10): CType

unsafe main(): Int64 {
    var count = 0

    var res1 = testfunc1(Int64(10))
    var res2 = testfunc2(10, 10)
    var res3 = testfunc2(20, 20)
    var res4 = testfunc2(Int64(30), Int64(30))

    match (res1) {
        case n: Int64 => count += 1
        case _ => ()
    }

    match (res2) {
        case n: Int64 => count += 1
        case _ => ()
    }

    match (res3) {
        case n: Int64 => count += 1
        case _ => ()
    }

    match (res4) {
        case n: Int64 => count += 1
        case _ => ()
    }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
// ASSERT: scan sema_cfunc_cannot_have_named_args
