// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f

func foo1(a!: Int32 = 1): Int32 {
    func foo2(b!: Int32 = 2): Int32 {
        func foo3(c!: Int32 = 3): Int32 {
            foo1()
            return 2
        }
        foo3()
        return 3
    }
    foo2()
    return 4
}

main(): Int32 {
    foo1()
}

// ASSERT: scan The Apply node in the line:16 and the column:9, was optimized by functionInlineForLambda
// ASSERT: scan The Apply node in the line:19 and the column:5, was optimized by functionInlineForLambda
