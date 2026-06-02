// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class C1<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
    public func test(): T {
        return this.a
    }
    public func test1(t: T): T {
        return t
    }
}

open class S1<T> <: C1<Int32> {
    public var b: T
    public init(x: T) {
        super(0)
        b = x
    }
}

class S2<T> <: S1<T> {
    public var c: T
    public init(x: T) {
        super(x)
        c = x
    }
}

func codegenUnitTest(): Int32 {
    let w = S2<Int64>(0)
    w.a = 1
    w.b = 10
    w.c = 100
    let ans1 = w.a + w.test() + Int32(w.b) + Int32(w.c) + w.test1(1000)
    var x: Array<C1<Int32>> = [S2<Int64>(0)]
    return ans1
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1112) {
        return 0
    } else {
        return -1
    }
}
