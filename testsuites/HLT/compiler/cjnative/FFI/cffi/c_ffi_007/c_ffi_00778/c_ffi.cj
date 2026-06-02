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

var count = 0

foreign func getCPointer(): CPointer<Int32>

foreign func free(cp: CPointer<Int32>): Unit

unsafe main(): Int64 {
    var cptr1: CPointer<Int32> = getCPointer()
    var cptr2: CPointer<Int32> = getCPointer()
    if (cptr1.isNull() || cptr2.isNull()) {
        return 2
    }
    cptr2.write(0, 1)

    var arr1: Array<CPointer<Int32>> = Array<CPointer<Int32>>()
    arr1 = [cptr1, cptr2, cptr1, cptr2, cptr1]

    var arr2: Array<CPointer<Int32>> = arr1.toArray()
    if ((arr2[0].read(0) == -2147483648) && (arr2[1].read() == 1) && (arr2[2].read(1) == 0) && (arr2[3].read() == 1) && (arr2[4]
        .read(2) == 2147483647)) {
        count += 1
    }

    var arr3: Array<CPointer<Int32>> = Array<CPointer<Int32>>(5, repeat: cptr1)
    if ((arr3[0].read(0) == -2147483648) && (arr3[1].read(1) == 0) && (arr3[2].read(1) == 0) && (arr3[3].read(1) == 0) &&
        (arr3[4].read(1) == 0)) {
        count += 1
    }

    free(cptr1)
    free(cptr2)
    cptr1 = CPointer<Int32>()
    cptr2 = CPointer<Int32>()
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
