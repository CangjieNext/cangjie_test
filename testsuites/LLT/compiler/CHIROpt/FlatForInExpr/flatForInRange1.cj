// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 -Woff all %f -o %n.%suffix 2>&1
// RUN-EXEC-42: %run %n.%suffix

func testNonCloseRange(n: Int64): Int64 {
    var sum = 0
    for (i in 0..n where i < 80) {
        if (sum > 20) {
            break
        }
        sum += i
    }
    return sum
}

func testCloseRange(n: Int64): Int64 {
    var sum = 0
    for (i in 0..=n where i < 80) {
        if (sum > 20) {
            return sum
        }
        sum += i
    }
    return sum
}

main() {
    var x = testNonCloseRange(100)
    var y = testCloseRange(100)
    return x + y
}
