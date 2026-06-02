// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
main() {
    let arr = [1, 2, 3, 4, 5]

    var arr1 = arr[1..3] // [2,3]
    var arr2 = arr1[1..] //[3]
    if (arr2 != [3]) {
        return 1
    }

    return 0
}
