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

var cptr1: (CPointer<Int16>) -> CPointer<Int8> = {
    a =>
    var b: CPointer<Int8> = CPointer<Int8>(a)
    unsafe { b.write(0, 49) } // ascii: '1' => 49
    return b
}
var cptr2: CFunc<(CPointer<Int16>) -> CPointer<Int8>> = {
    a =>
    var b: CPointer<Int8> = CPointer<Int8>(a)
    unsafe { b.write(0, 49) } // ascii: '1' => 49
    return b
}

foreign func get_cptr(): CFunc<(CPointer<Int8>) -> CPointer<Int8>>

unsafe main(): Int64 {
    cptr2 = cptr1
    var cptr3: CFunc<(CPointer<Int64>) -> CPointer<Int8>> = cptr1
    return 0
}
// ASSERT: scan sema_mismatched_types
