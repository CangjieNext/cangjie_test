// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
main() {
    let arr = [1, 2, 3, 4, 5]

    if (arr[3..3] != []) {
        return 1
    }
    arr[3..3].fill(88)
    if (arr != [1, 2, 3, 4, 5]) {
        return 2
    }
    arr[3..=3].fill(88)
    if (arr != [1, 2, 3, 88, 5]) {
        return 3
    }
    arr[4..4].fill(99)
    if (arr != [1, 2, 3, 88, 5]) {
        return 4
    }

    return 0
}
