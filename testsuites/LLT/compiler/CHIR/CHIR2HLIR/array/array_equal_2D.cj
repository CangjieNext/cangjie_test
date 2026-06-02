// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    var arr1 = [[1, 2, 3, 4, 5], [6, 7, 8]]
    var arr2 = [[1, 2, 3, 4, 5], [6, 7, 8]]
    var arr3 = [[1, 2, 3, 4, 5], [6]]
    if (arr1 == arr3) {
        return 1
    }
    if (arr1 != arr2) {
        return 1
    }
    println(arr1.toString())
    println(arr2.toString())
    println(arr3.toString())
    return 0
}
