// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    var arr1: Array<Int64> = [1, 2, 3, 4, 5]
    var arr2: Array<Int64> = [1, 2, 3, 4]
    var arr3: Array<Int64> = [1, 2, 3, 4, 5]
    if (arr1 != arr3) {
        return 1
    }
    if (arr1 == arr2) {
        return 1
    }
    println(arr1)
    println(arr2)
    println(arr3)
    return 0
}
