// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// ASSERT: scan The Apply node in the line:19 and the column:17, was optimized by Function Inline

var a = 1

func foo1() {
    return 0
}

func foo2() {
    for (i in 1..100) {
        let b = foo1()
        if (b < 1) {
            return 0
        }
    }
    return 1
}

main() {
    foo2()
}
