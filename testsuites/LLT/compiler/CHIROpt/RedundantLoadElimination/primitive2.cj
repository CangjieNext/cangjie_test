// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@CJ_CORE_PrintSigned, %5
// ASSERT: scan Add(%5, %5)
// ASSERT: scan Load(%3) // loc: "primitive2.cj"-34-13
// ASSERT: scan-not Load(%3) // loc: "primitive2.cj"-29
// ASSERT: scan-not Load(%3) // loc: "primitive2.cj"-31
// ASSERT: scan-not Load(%3) // loc: "primitive2.cj"-36

func goo(x: Int64) {
    x + x
}

var gv1 = 1;
var gv2 = 3;
var gv3 = 4;

func foo(cond: Bool) {
    var x = gv1
    if (cond) {
        println(x)
    } else {
        goo(x)
        x = gv2
    }
    println(x)
    x = gv3
    var b = x
}

main() {
    foo(true);
    0
}
