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
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

foreign func free(cp: CPointer<Unit>): Unit

var pass = 0

@C
func cptr(a: CPointer<Int8>): Unit {
    unsafe {
        if (a.read(1) == 48) {
            pass += 1
        }
        free(CPointer<Unit>(a))
    }
}

foreign func get_cptr(cb: CFunc<(CPointer<Int8>) -> Unit>): Unit

unsafe main(): Int64 {
    get_cptr(cptr)
    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
