/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let arr1: Array<Int64> = [0]
    let arr2: Array<Array<Array<Int32>>> = [[[1]]]
    let arr3: Array<Array<Array<Array<Array<Array<Int32>>>>>>
    let arr4 = [[[[1], [2]]], [[[3], [4]]]]
    if (arr1[0] == 0 && arr2[0][0][0] == 1 && arr4[0][0][0][0] == 1) {
        return 0
    }
    return 1
}
