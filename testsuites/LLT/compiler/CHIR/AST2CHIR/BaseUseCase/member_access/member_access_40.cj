// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    static func foo(): Int64
    static func bar(x: Int64): Int64 {
        foo() // here we generate InvokeStatic
    }
}

class C1 <: I {
    public static func foo(): Int64 {
        1
    }
}

class C2 <: I {
    public static func foo(): Int64 {
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
