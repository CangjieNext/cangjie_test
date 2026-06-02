// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f

func f() {
    var x = 1
    func g() {
        func m() {
            print(x)
        }
        m()
    }
    g()
}

main() {
    f()
}

// ASSERT: scan The Apply node in the line:16 and the column:9, was optimized by functionInlineForLambda
// ASSERT: scan The Apply node in the line:18 and the column:5, was optimized by functionInlineForLambda
// ASSERT: scan The Apply node in the line:22 and the column:5, was optimized by Function Inline
