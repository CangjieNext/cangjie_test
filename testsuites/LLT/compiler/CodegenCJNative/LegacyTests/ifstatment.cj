// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_if(a: Int32, b: Int32): Int32 {
    var x: Int32 = 0
    if (a == b) {
        x++
    }
    return x
}

func ark_if_else(a: Int32, b: Int32): Int32 {
    var x: Int32 = 0
    if (a == b) {
        x++
    } else {
        x--
    }
    return x
}

func ark_if_else_if(a: Int32, b: Int32): Int32 {
    var x: Int32 = 0
    if (a == b) {
        x++
    } else if (b == 2) {
    } else {
        x--
    }
    return x
}

func f(): Bool {
    if (true) {
        return true
    } else {
        return false
    }
}

func codegenUnitTest(): Int32 {
    return ark_if(40, 2) + ark_if_else(40, 2) + ark_if_else_if(40, 2)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == -1) {
        return 0
    } else {
        return -1
    }
}
