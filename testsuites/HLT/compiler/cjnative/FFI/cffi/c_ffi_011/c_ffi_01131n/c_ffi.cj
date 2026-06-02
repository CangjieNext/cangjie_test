/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c cfg.json
// (not Windows) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// (not Windows) EXEC: %clang %clang_opt %n.c -o %cffi_output
// (not Windows) EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign func testfunc(cb: CFunc<(Int8, Int8) -> Array<Int8>>): Array<Int8>

var add_i8: CFunc<(Int8, Int8) -> Array<Int8>> = {a: Int8, b: Int8 => return a[0] + b}

unsafe main(): Int64 {
    if (testfunc(add_i8) == -128) {
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
// (not Windows) ASSERT: scan sema_invalid_cfunc_return_type
// (not Windows) ASSERT: scan sema_invalid_subscript_expr
// (not Windows) ASSERT: scan sema_invalid_binary_expr
