// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f

class A <: Exception {}

struct B {
    public func test(a!: Int64) {
        try {
            throw A()
        } finally {}
    }
}

main() {
    B().test(a: 1)
    return 0
}

// ASSERT: scan-2 The Apply node in the line:21 and the column:5, was optimized by Function Inline
