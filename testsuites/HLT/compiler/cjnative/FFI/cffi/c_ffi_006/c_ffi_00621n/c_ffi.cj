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

foreign func testfunc(fmt: String): Int32

main(): Int64 {
    unsafe {
        if (testfunc("Hello World\n") == 12) {
            print("PASS\n")
        } else {
            print("ERROR\n")
        }
    }
    return 0
}
// (not Windows) ASSERT: scan sema_invalid_cfunc_arg_type
