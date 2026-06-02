// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
main() {
    let arr = [1, 2, 3, 4, 5]
    var count = 0
    try {
        arr[1..3] = [2, 2, 2] // left size < right size
    } catch (e: Exception) {
        count++
        if (!e.message.contains("The length of the value array is 3, which does not match the range length of 2.")) {
            return 1
        }
    }
    if (count != 1) {
        return 2
    }

    return 0
}
