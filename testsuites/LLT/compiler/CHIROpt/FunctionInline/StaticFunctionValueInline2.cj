// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

func foo(a: (Int32) -> Int32, b: Int32): Int32 {
    if (b < 3) {
        return foo(a, b + 1)
    }
    return 1
}

class Boo<T> {
    public static var b: Int32 = 2
    public static func moo1(x!: Int32 = b) {
        return x
    }
    public static func moo2(x!: Int32 = b) {
        return x
    }
    public func noo1() {
        let tuple = [moo1, moo2]
        return tuple
    }
    public func noo2() {
        let x = foo(moo1, 1)
        return x
    }
}

main(): Int64 {
    var b = Boo<Int64>()
    b.noo1()
    b.noo2()
    return 0
}

// ASSERT: scan The Apply node in the line:38 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:39 and the column:5, was optimized by Function Inline
