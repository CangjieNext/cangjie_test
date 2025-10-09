/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.runtime.*

class Test {
    public static var t0: Int32 = 0
    public init() {
        t0++
    }
    ~init() {
        t0--
    }
}

func foo(): Int32 {
    let o1 = Test()
    return Test.t0
}

// Objective: for a blocking GC call, current GC is finished before the call returns
main(): Int64 {
    var i: Int64 = 0
    while (i < 100) {
        if (foo() != 1) {
            print("fail: obj is freed before GC!")
            return 1
        }
        while (Test.t0 != 0) {
            GC()
            continue;
        }
        i++
    }
    print("success")
    return 0
}
