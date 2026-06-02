// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface Inf {
    static func f(): Int32 {
        1100
    }
}

class A <: Inf {}

open class Test {
    public var a: Int32 = 100
    public static func f(): Int32 {
        100000
    }
    public static var s: Int32 = 10000
}

func classTest(): Int32 {
    var testf = Test.f
    return testf() + Test.s + A.f()
}

func codegenUnitTest(): Int32 {
    return classTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 111100) {
        return 0
    } else {
        return -1
    }
}
