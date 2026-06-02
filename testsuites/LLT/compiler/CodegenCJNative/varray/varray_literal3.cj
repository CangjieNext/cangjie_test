// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

main() {
    var arr1: VArray<VArray<Int64, $5>, $3> = [[1, 2, 3, 4, 5], [11, 12, 13, 14, 15], [111, 112, 113, 114, 115]]
    arr1[0] = [66, 67, 68, 69, 70]
    var arr2 = arr1
    println(arr2[0][4])
    if (arr1[0][4] != 70 || arr1[1][0] != 11 || arr1[2][1] != 112) {
        return 1
    }
    return 0
}
