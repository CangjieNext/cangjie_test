// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 -Woff all %f -o %n.%suffix 2>&1
// RUN-EXEC-6: %run %n.%suffix

func testNonCloseRange(n: Int64): Int64 {
    var sum = 0
    for (i in 0..n where i < 4) {
        sum += i
    }
    return sum
}

main() {
    var x = testNonCloseRange(100)
    return x
}
