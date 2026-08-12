// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default8global01Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// let g1/g2 folded; var g3 remains Load.
// ASSERT: scan Load(@_CN7default2g3E)
// ASSERT: scan-not Load(@_CN7default2g1E)
// ASSERT: scan-not Load(@_CN7default2g2E)
// ASSERT: scan Constant(1i)

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
