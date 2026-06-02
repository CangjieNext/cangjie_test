// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

class Aoo {
    public static var b: Int32 = 2
    public static func moo1(x!: Int32 = b) {
        return x
    }
    public func noo1() {
        var a = moo1
        return a
    }
}

class Boo<T> {
    public static var b: Int32 = 2
    public static func moo1(x!: Int32 = b) {
        return x
    }
    public static func moo2<T>(x!: Int32 = b) {
        return x
    }
    public func noo1() {
        var a = moo1
        return a
    }
    public func noo2() {
        var a = moo2<Int32>
        return a
    }
    public func noo3() {
        var a = moo1()
        return a
    }
}

main(): Int64 {
    var a = Aoo()
    a.noo1()(2)
    var b = Boo<Int64>()
    b.noo1()(2)
    b.noo2()(2)
    b.noo3()
    return 0
}

// ASSERT: scan The Apply node in the line:46 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:48 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:49 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:50 and the column:5, was optimized by Function Inline
