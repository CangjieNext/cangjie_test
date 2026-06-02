// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

class CA<T> {
    static func staticTest() {
        0
    }
    func test(x: T) {
        0
    }
}

struct SA<T> {}

extend<T> SA<T> {
    func test(x: T) {
        return x
    }
}

main() {
    CA<Int64>.staticTest()
    CA<Int64>().test(0)
    SA<Int64>().test(0)
}

// ASSERT: scan The Apply node in the line:29 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:30 and the column:5, was optimized by Function Inline
// ASSERT: scan The Apply node in the line:30 and the column:5, was optimized by Function Inline
