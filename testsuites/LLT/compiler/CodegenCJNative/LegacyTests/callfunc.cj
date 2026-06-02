// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_foo1(a: Int64): Unit {
    let c: Int64 = a + 1
}

func ark_foo2(a: Int64): Int64 {
    return a - a
}

func ark_call(a: Int64): Int64 {
    func ark_foo2(a: Int64): Int64 {
        return a * a
    }
    let x: Int64 = a
    ark_foo1(x)
    let y: Int64 = ark_foo2(x)
    var z = 0
    if (z == 0) {
        func ark_foo2(a: Int64): Int64 {
            return a * a * a
        }
        z = ark_foo2(x)
    } else {
        func ark_foo2(a: Int64): Int64 {
            return a * a * a * a
        }
        z = ark_foo2(x)
    }
    return y + z
}

func codegenUnitTest(): Int64 {
    return ark_call(7)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 392) {
        return 0
    } else {
        return -1
    }
}
