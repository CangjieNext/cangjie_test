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

foreign func cfoo1(a: CPointer<Int32>): Unit

foreign func cfoo2(a: VArray<Int32, $3>): Unit

foreign func getArrayPtr(): CPointer<Int32>

main() {
    unsafe {
        var a: CPointer<Int32> = getArrayPtr()
        cfoo1(a)
        return a.read(0) + a.read(1) + a.read(2) - 5
    }
}
