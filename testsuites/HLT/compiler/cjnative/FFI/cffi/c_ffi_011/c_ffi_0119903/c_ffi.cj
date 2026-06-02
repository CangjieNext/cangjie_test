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

var pass = 0

@C
func cptr(a: Unit): CPointer<Unit> {
    var b: CPointer<Unit> = CPointer<Unit>()

    return b
}

foreign func get_cptr(cb: CFunc<(Unit) -> CPointer<Unit>>): CPointer<Unit>

unsafe main(): Int64 {
    get_cptr(cptr)

    return 0
}
// ASSERT: scan sema_cfunc_cannot_have_unit_args
