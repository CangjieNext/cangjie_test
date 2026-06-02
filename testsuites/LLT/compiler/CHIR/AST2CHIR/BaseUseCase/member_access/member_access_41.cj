// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {
    static func foo(x: T): T
    static func bar(x: T): T {
        foo(x) // here we generate InvokeStatic
    }
}

class C1 <: I<Int64> & I<Bool> {
    public static func foo(x: Int64): Int64 {
        1
    }
    public static func foo(x: Bool): Bool {
        false
    }
}

class C2 <: I<Int64> {
    public static func foo(x: Int64): Int64 {
        2
    }
}

func trouble(b: Bool): (Int64) -> Int64 {
    if (b) {
        C1.bar
    } else {
        C2.bar
    }
}

main() {
    trouble(false)(1) - trouble(true)(1) - 1
}
