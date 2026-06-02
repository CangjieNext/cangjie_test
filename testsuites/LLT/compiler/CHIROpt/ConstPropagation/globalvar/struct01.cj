// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

struct SA {
    var x = 0
    var y = 0
}

var g1 = SA()
let g2 = if (true) {
    g1.x = 1
    g1.y = 3
    g1.x + g1.y
} else {
    foo();
    0
}

func foo() {
    g1.x = 999
}

main(): Int64 {
    var a = g2
    if (a == 4) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex-not \[ConstPropagation\] The Load at \[struct01\.cj,
