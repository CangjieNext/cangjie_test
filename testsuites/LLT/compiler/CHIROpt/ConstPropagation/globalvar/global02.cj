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
    g2
} else {
    g1;
    4
}
let g4 = try {
    g1
} catch (_) {
    g3
}
let g5 = try {
    g1
} catch (_) {
    g1
}

func global01(): Int64 {
    var a = g3
    var b = g4
    if (a == 1 && b == 1) {
        return 0
    } else {
        return 1
    }
}

func global02(): Int64 {
    if (g2 == 1) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return global01() + global02()
}

// ASSERT: regex \[ConstPropagation\] The Load at \[global02\.cj,12,10\] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[global02\.cj,13,.*\] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global02\.cj,20,.*\] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global02\.cj,25,.*\] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[global02\.cj,31,.*\] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global02\.cj,32,.*\] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[global02\.cj,41,.*\] has been rewrited to a constant