// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 -Woff all %f -o %n.%suffix
// RUN-EXEC-1: %run %n.%suffix

func testForInIterWithGuard(): Int64 {
    var res: Int64 = 0
    let arr_str = ["A", "B", "C", "D", "E", "F"]
    for (i in arr_str where i == "B") {
        res++
    }
    return res
}

main() {
    var y = testForInIterWithGuard()
    return y
}
