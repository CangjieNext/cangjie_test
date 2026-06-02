// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-1: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var l_a: Array<Int32> = [4]
    var r_a: Int32 = 2
    var r_b: Int32 = 3
    l_a[0] = if (trwe) {
        r_a
    } else {
        r_b
    }
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
