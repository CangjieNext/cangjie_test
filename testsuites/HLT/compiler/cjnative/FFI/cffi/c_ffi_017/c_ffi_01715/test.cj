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

foreign func cfoo1(a: VArray<VArray<Int64, $3>, $1>): Unit

foreign func cfoo2(a: CPointer<VArray<Int64, $3>>): Unit

foreign func getArrayPtr(): CPointer<VArray<Int64, $3>>

main() {
    var a: VArray<VArray<Int64, $3>, $1> = [[1, 2, 3]]
    unsafe {
        cfoo1(inout a)
    }
    return a[0][0] + a[0][1] + a[0][2] - 5
}
