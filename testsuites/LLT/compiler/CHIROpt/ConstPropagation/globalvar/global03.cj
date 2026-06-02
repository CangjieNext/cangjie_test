// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

let g1 = 1
var g2 = g1
let g3 = if (true) {
    func foo() {
        g2 = 2
        g2
    };
    foo()
} else {
    func foo() {
        g1
    };
    foo()
}
var g4 = g2
let g5 = if (true) {
    func foo() {
        g4 = 3
        g4
    };
    foo
} else {
    func foo() {
        g1
    };
    foo
}
let g6 = g4

func global01(): Int64 {
    var result = g3.toString() + g4.toString() + g5().toString() + g6.toString()
    println(result)
    if (result == "2232") {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return global01()
}

// ASSERT: regex-not \[ConstPropagation\] The Load at \[24,.*\] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[37,.*\] has been rewrited to a constant