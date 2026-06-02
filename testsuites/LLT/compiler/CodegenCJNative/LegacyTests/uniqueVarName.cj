// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_varName_Int1(a: Int32, b: Int32): Int32 {
    func tmp(a: Int32, b: Int32): Int32 {
        return a - b
    }
    if (true) {
        var a: Int32 = 20
        return tmp(a, b)
    }
    return tmp(a, b)
}

func ark_varName_Int(a: Int32, b: Int32): Int32 {
    var c: Int32 = 3
    if (true) {
        var a: Int32 = 11
        var c: Int32 = 7
        return a + b + c + ark_varName_Int1(a, c)
    }
    return a + b + c
}

func codegenUnitTest(): Int32 {
    ark_varName_Int(1, 3)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 34) {
        return 0
    } else {
        return -1
    }
}
