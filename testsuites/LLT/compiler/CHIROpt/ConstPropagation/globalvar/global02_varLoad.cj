// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default8global02Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// var g2 must remain Load in user code.
// ASSERT: scan Load(@_CN7default2g2E)

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
