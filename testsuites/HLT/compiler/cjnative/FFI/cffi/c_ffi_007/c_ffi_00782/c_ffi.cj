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

foreign func getCPointer(): CPointer<UInt32>

foreign func free(cp: CPointer<UInt32>): Unit

unsafe main(): Int64 {
    var cptr1: CPointer<UInt32> = getCPointer()
    var cptr2: CPointer<UInt32> = getCPointer()
    if (cptr1.isNull() || cptr2.isNull()) {
        return 2
    }
    cptr2.write(0, 1)
    cptr2.write(1, 11)
    cptr2.write(2, 111)

    var arr1: Array<CPointer<UInt32>> = [cptr1, cptr2, cptr1, cptr2, cptr1]

    if ((arr1[0].read(0) == 0) && (arr1[0].read(1) == 2) && (arr1[0].read(2) == 4294967295)) {
        count += 1
    }

    if ((arr1[1].read(0) == 1) && (arr1[1].read(1) == 11) && (arr1[1].read(2) == 111)) {
        count += 1
    }

    var itr = arr1.iterator()

    if (arr1.get(0).getOrThrow().read(0) == 0) {
        count += 1
    }

    arr1[0] = cptr2

    if (arr1.get(0).getOrThrow().read(0) == 1) {
        count += 1
    }

    free(cptr1)
    free(cptr2)
    cptr1 = CPointer<UInt32>()
    cptr2 = CPointer<UInt32>()

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
