// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Field(%7, 0) // loc: "struct5.cj"-36-5
// ASSERT: scan Load(%3) // loc: "struct5.cj"-40-9
// ASSERT: scan Load(%3) // loc: "struct5.cj"-45-9

struct SC {
    var y = 111
    mut func mutFunc1() {
        y = 222
    }
}

struct SA {
    var x = 999
    var sc = SC()
    mut func mutFunc2() {
        x = 777
    }
}

func goo(sa: SA) {
    println(sa.x)
}

func foo(cond: Bool) {
    var sa = SA()
    goo(sa)
    try {
        sa.mutFunc2()
    } finally {}
    goo(sa)
    sa = SA()
    try {
        sa.sc.mutFunc1()
    } finally {}
    goo(sa)
}

main() {
    foo(true);
    0
}
