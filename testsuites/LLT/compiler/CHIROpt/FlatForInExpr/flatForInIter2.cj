// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 -Woff all %f -o %n.%suffix
// RUN-EXEC-6: %run %n.%suffix

func testForInIter(): Int64 {
    var res: Int64 = 0
    let arr_str = ["A", "B", "C", "D", "E", "F"]
    for (i in arr_str) {
        res++
    }
    return res
}

main() {
    var z = testForInIter()
    return z
}
