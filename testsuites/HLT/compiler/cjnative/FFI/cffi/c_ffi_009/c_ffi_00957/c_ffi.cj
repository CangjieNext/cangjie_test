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

@C
struct teststruct<T> {
    var i8: T = 10
    var i16: T = 10
    var i64: T = 10
    var cf1: CFunc<(T, T) -> T> = {
        a, b => return a + b
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(ts: teststruct): teststruct
}

unsafe main(): Int64 {
    var count = 0

    var struct1 = testfunc1()
    return 0
}
// ASSERT: scan sema_cffi_cannot_have_type_param
// ASSERT: scan sema_illegal_member_of_cstruct
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_generic_type_without_type_argument
