// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {
    public var a: Int32 = 500
    public func x(): Int32 {
        1000
    }
}

struct Test {
    public var a: A
    public init(a: A) {
        this.a = a
    }
}

func structTest(): Int32 {
    var t: Test = Test(A())
    var a = t.a
    return a.a + t.a.x()
}

func codegenUnitTest(): Int32 {
    return structTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1500) {
        return 0
    } else {
        return -1
    }
}
