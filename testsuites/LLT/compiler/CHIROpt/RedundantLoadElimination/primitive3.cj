// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex = Load\(%\d+\) // loc: "primitive3.cj"-26-13
// ASSERT: regex-begin %(?P<v>\d+): Int64 = Load\(@_CN7default3gv2E\)
// ASSERT: regex-after Apply\(@CJ_CORE_PrintSigned, %(?P=v)
// ASSERT: regex-not = Load\(%\d+\) // loc: "primitive3.cj"-28

func goo(x: Int64) {
    x + x
}

var gv1 = 1;
var gv2 = 2;

func foo(cond: Bool) {
    var x = gv1
    while (cond) {
        goo(x)
        x = gv2
        println(x)
    }
}

main() {
    foo(false);
    0
}
