// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func param_capture(x: Int64) {
    return {a: Int64 => return a + x}
}

func param_capture2(x: Int64) {
    let ans = {a: Int64 => return a + x + 1}
    return ans
}

func param_capture3(z: Int64) {
    let a: Int64 = 1
    return {
        => return a + z + 2
    }
}

func ark_lambda_capture(x: Int64): Int64 {
    var one = 1
    let one_cap = one
    var lambda1 = {
        a: Int64 => return a + one_cap + 2
    }
    one = one + 1
    let two = one
    var lambda2 = {a: Int64 => return a + two}
    var ans1 = lambda1(10) // 13
    var lambda3 = param_capture(1)
    var lambda4 = param_capture(20)
    var ans2 = lambda3(10) // 11
    var lambda5 = param_capture2(1)
    var ans3 = lambda5(10) // 12
    var lambda6 = param_capture3(1)
    var ans4 = lambda6() // 2
    return ans1 * 100000 + ans2 * 1000 + ans3 * 10 + ans4
}

func codegenUnitTest(): Int64 {
    return ark_lambda_capture(3)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1311124) {
        return 0
    } else {
        return -1
    }
}
