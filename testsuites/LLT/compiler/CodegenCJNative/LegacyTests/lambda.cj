// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_lambda(x: Int32): Int32 {
    var sum = {a: Int32, b: Int32 => return a - b}
    sum = {a: Int32, b: Int32 => return a + b}
    var pow = {
        a: Int32, b: Int32 =>
        var mul = {a: Int32, b: Int32 => return a * b}
        var ans: Int32 = 1
        var i: Int32 = 0
        while (i < b) {
            ans = mul(ans, a)
            i++
        }
        return ans
    }
    return sum(1, 2) + pow(sum(1, 2), 3) + 30
}

let jumpExpression = {
    =>
    while (true) {
        var a = 1;
        continue
    }
    do {
        break
    } while (false)
}

func codegenUnitTest(): Int32 {
    return ark_lambda(3)
}

var test: Int32 = 1
let lambda = {i: Int32 => test - i}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 60) {
        return 0
    } else {
        return -1
    }
}
