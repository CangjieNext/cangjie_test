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
// ERRCHECK: %compiler %cmp_opt %ffic_opt -o %output

foreign func cfoo1(a: CPointer<Int32>): Unit

foreign func cfoo2(a: VArray<Int32, $3>): Unit

foreign func getArrayPtr(): VArray<Int32, $3>

main() {
    unsafe {
        var a: VArray<Int32, $3> = getArrayPtr()
        cfoo1(inout a)
        return a[0] + a[1] + a[2] - 5
    }
}
// ASSERT: scan sema_varray_in_cfunc
