// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func param_closure(x: Int64) {
    let sum = 1
    return {
        a: Int64 => return sum + a + x
    }
}

func change_param(x: Int64) {
    var f = {a: Int64 => return a + x}
    var ans = f(1) // 2
    f = {a: Int64 => return a + x + 1}
    ans = ans + f(1) // 5
    return ans
}

func codegenUnitTest(): Int64 {
    var closure = param_closure(2)
    var ans = closure(1) + closure(1) // 9
    return ans * 10 + change_param(1)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 85) {
        return 0
    } else {
        return -1
    }
}
