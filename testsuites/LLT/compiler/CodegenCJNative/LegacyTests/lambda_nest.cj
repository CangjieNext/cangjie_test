// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func nest(a: Int64) {
    let x_cap = 1000
    return {
        b: Int64 =>
        let y_cap = 10000
        return {
            c: Int64 =>
            let x = x_cap * 3
            let y = y_cap * 2
            return x + y + a * 4 + b * 5 + c * 6
        }
    }
}

func codegenUnitTest(): Int64 {
    var lambda = nest(100)
    var lambda1 = lambda(10)
    var ans = lambda1(1)
    return ans
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 23456) {
        return 0
    } else {
        return -1
    }
}
