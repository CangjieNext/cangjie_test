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

foreign func cfoo1(a: CPointer<VArray<Int32, $3>>): Unit

foreign func cfoo2(a: VArray<VArray<Int32, $3>, $1>): Unit

foreign func getArrayPtr(): CPointer<VArray<Int32, $3>>

main() {
    unsafe {
        var a = getArrayPtr()
        cfoo2(a)
        return a.read(0)[0] + a.read(0)[1] + a.read(0)[2] - 5
    }
}
// ASSERT: scan sema_mismatched_types
