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

var cptr: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = {
    a =>
    var b: CPointer<Int8> = a
    unsafe { b.write(0, 48) }
    return b
}

@C
foreign func get_cptr1(cb!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

@C
foreign func get_cptr2(cb1!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr,
    cb2!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

@C
foreign func get_cptr3(cb1!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr,
    cb2!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

@C
foreign func get_cptr4(cb1!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr,
    cb2!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr, cb3!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

@C
foreign func get_cptr5(cb1!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr,
    cb2!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr, cb3!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

@C
foreign func get_cptr6(cb1!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr,
    cb2!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr, cb3!: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = cptr): CPointer<Int8>

main() {}
// ASSERT: scan sema_cfunc_cannot_have_named_args
