// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f

func test(param1: UInt32, param2: UInt32, param3: UInt32) {
    var b = param1 + param2 + param3
    return b--
}

main() {
    test(0, 1, 2)
    return 0
}

// ASSERT: scan The Apply node in the line:16 and the column:5, was optimized by Function Inline
