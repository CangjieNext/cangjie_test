// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    var arr1 = Array<Int16>(5, {i => 0})
    var arr2 = Array<Int16>(5, {i => Int16(i)})
    arr2.copyTo(arr1, 1, 2, 2)
    for (i in 1..3) {
        if (arr1[i + 1] != arr2[i]) {
            return 1
        }
    }
    if (arr1[0] != 0 || arr1[1] != 0 || arr1[4] != 0) {
        return 1
    }
    return 0
}
