// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

let g1 = 1
let g2 = g1
var g3 = g1
var g4 = g3

func global01(): Int64 {
    var a = g1
    var b = g2
    var c = g3
    if (a == 1 && b == 1 && c == 1) {
        return 0
    } else {
        return 1
    }
}

func global02(): Int64 {
    var a = (1, g2, 2)
    var b = a
    if (b[0] == 1 && b[1] == 1 && b[2] == 2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return global01() + global02()
}

// ASSERT: regex \[ConstPropagation\] The Load at \[global01.cj,12.* has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global01.cj,13.* has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[global01\.cj,14,.*\] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global01.cj,17.* has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Load at \[global01.cj,18.* has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at \[global01\.cj,19,.*\] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Field at \[global01.cj,30,9] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Field at \[global01.cj,30,22] has been rewrited to a constant
// ASSERT: regex \[ConstPropagation\] The Field at \[global01.cj,30,35] has been rewrited to a constant
