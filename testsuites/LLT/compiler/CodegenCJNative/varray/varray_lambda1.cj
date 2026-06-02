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
    var arr1: VArray<Int64, $5> = VArray<Int64, $5>({i => i})
    arr1[4] = 66

    if (arr1[0] != 0 || arr1[1] != 1 || arr1[2] != 2 || arr1[3] != 3 || arr1[4] != 66) {
        return 1
    }
    println(arr1[4])
    return 0
}
