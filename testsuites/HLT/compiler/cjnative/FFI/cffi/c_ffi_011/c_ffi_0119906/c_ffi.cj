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
func cptr1(a!: CPointer<Int8>): CPointer<Int8> {
    var b: CPointer<Int8> = a
    unsafe { b.write(0, 49) }
    return b
}

@C
func cptr2(a!: CPointer<Int8>, b!: CPointer<Int8>): CPointer<Int8> {
    var c: CPointer<Int8> = a
    unsafe { c.write(0, 49) }
    return c
}

@C
func cptr3(a: CPointer<Int8>, b!: CPointer<Int8>): CPointer<Int8> {
    var c: CPointer<Int8> = a
    unsafe { c.write(0, 49) }
    return c
}

@C
func cptr4(a!: CPointer<Int8>, b!: CPointer<Int8>, c!: CPointer<Int8>): CPointer<Int8> {
    var d: CPointer<Int8> = a
    unsafe { d.write(0, 49) }
    return d
}

@C
func cptr5(a: CPointer<Int8>, b: CPointer<Int8>, c!: CPointer<Int8>): CPointer<Int8> {
    var d: CPointer<Int8> = a
    unsafe { d.write(0, 49) }
    return d
}

@C
func cptr6(a: CPointer<Int8>, b!: CPointer<Int8>, c!: CPointer<Int8>): CPointer<Int8> {
    var d: CPointer<Int8> = a
    unsafe { d.write(0, 49) }
    return d
}

@C
foreign func get_cptr1(cb: CFunc<(CPointer<Int8>) -> CPointer<Int8>>): CPointer<Int8>

unsafe main(): Int64 {
    var res: CPointer<Int8> = get_cptr1(cptr1)
    return 0
}
// ASSERT: scan sema_cfunc_cannot_have_named_args
