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

foreign func getCPointer(): CPointer<Float32>

foreign func free(cp: CPointer<Float32>): Unit

unsafe main(): Int64 {
    var cptr1: CPointer<Float32> = getCPointer()
    var cptr2: CPointer<Float32> = getCPointer()
    if (cptr1.isNull() || cptr2.isNull()) {
        return 2
    }
    cptr2.write(0, 1.0)

    var arr1: Array<CPointer<Float32>> = [cptr1, cptr2, cptr1, cptr2, cptr1]

    var arr2 = arr1.slice(1, 2)

    if (arr2[1].read(2) == -3.14) {
        count += 1
    }

    if (arr2[0].read(0) == 1.0) {
        count += 1
    }

    free(cptr1)
    free(cptr2)
    cptr1 = CPointer<Float32>()
    cptr2 = CPointer<Float32>()

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
