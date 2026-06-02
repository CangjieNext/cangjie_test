// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
main() {
    var count = 0
    let arr = [1, 2, 3, 4, 5]

    try {
        arr[1..3 : 2].fill(1)
    } catch (e: IllegalArgumentException) {
        count++
        if (e.message != "Illegal step 2, step should be 1.") {
            return 1
        }
    }

    try {
        arr[1..3 : -1].fill(2)
    } catch (e: IllegalArgumentException) {
        count++
        if (e.message != "Illegal step -1, step should be 1.") {
            return 2
        }
    }

    if (count != 2) {
        return 3
    }
    return 0
}
