// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Load(@_CN7default2g2E)

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
