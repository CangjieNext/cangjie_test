// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var num = 0

func genPre2(): Int64 {
    FibGen.pre1 + 1
}

class FibGen {
    public static var pre1 = 0
    public static var pre2 = genPre2()
    public func getNext(): Int64 {
        num = pre1 + pre2
        pre2 = pre1
        pre1 = num
        return num
    }
}

var res = FibGen().getNext()

main() {
    for (i in 1..10) {
        res = res + FibGen().getNext()
    }
    // res = 1 + 1 + 2 + 3 + 5 + 8 + 13 + 21 + 34 + 55 = 143
    return res - 143
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
