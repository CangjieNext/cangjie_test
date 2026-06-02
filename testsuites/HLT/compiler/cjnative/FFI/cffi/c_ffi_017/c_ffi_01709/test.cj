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

foreign func cfoo1(a: VArray<Int32, $3>): Unit

foreign func cfoo2(a: CPointer<Int32>): Unit

foreign func getArrayPtr(): CPointer<Int32>

main() {
    var a: VArray<Int32, $3> = [1, 2, 3]
    unsafe {
        cfoo2(inout a)
    }
    return a[0] + a[1] + a[2] - 5
}
