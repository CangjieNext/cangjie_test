// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I1<T> {
    func test1(t: T): T
}

interface I2<T> <: I1<T> {}

class S2<T> <: I2<T> {
    public var c: T
    public init(n: T) {
        c = n
    }
    public func test1(t: T): T {
        return t
    }
}

func codegenUnitTest(): Int64 {
    let w = S2<Int64>(0)
    w.c = 100
    let ans1 = w.c + w.test1(1000)
    return ans1
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1100) {
        return 0
    } else {
        return -1
    }
}
