// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class R {
    public var a: Int32 = 50
}

open class CC <: AC {
    public var b: Int32 = 100
    public func af(): Int32 {
        b
    }
}

abstract class AC <: R {
    public func af(): Int32
    public func cf(i: Int32): Int32 {
        a + 50
    }
}

func classTest(): Int32 {
    var x: AC = CC()
    return x.af() + x.cf(50)
}

func codegenUnitTest(): Int32 {
    return classTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    print(ret.toString())
    if (ret == 200) {
        return 0
    } else {
        return -1
    }
}
