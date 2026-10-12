// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Field(%7, 0) // loc: "struct3.cj"-39-5
// ASSERT: scan Field(%12, 0) // loc: "struct3.cj"-41-5
// ASSERT: scan Field(%12, 0) // loc: "struct3.cj"-42-5
// ASSERT: scan Field(%12, 0) // loc: "struct3.cj"-43-5
// ASSERT: scan-not Load(%3) // loc: "struct3.cj"-42
// ASSERT: scan-not Load(%3) // loc: "struct3.cj"-43

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
    sa.mutFunc2()
    goo(sa)
    goo(sa)
    goo(sa)
}

main() {
    foo(true)
}
