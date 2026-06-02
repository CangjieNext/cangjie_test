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

foreign func ptrfunc(p: CPointer<Int32>): CPointer<Int16>

foreign func getptr(): CPointer<Int32>

foreign func free(cp: CPointer<Int32>): Unit

var count = 0

unsafe main(): Int64 {
    var ptr: CPointer<Int32> = getptr()
    var newptr: CPointer<Int32> = CPointer<Int32>(ptrfunc(ptr))

    if (newptr.read(0) == 32768) {
        count += 1
    }
    free(ptr)
    free(newptr)

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
