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
    let a: VArray<Int64, $2> = [1, 2]
    let arr = VArray<VArray<Int64, $2>, $5>({i => a})
    let tuple: (Int64, VArray<Int64, $2>) = (2, a)
    let tuple1: (Int64, VArray<Int64, $2>) = (2, [8, 9])
    if (arr[4][0] != 1 || tuple[1][0] != 1 || tuple1[1][0] != 8) {
        return 1
    }
    return 0
}
