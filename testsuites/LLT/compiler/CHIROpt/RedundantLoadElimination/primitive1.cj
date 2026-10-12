// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Load(@_CN7default3gv1E)
// ASSERT: scan Load(@_CN7default3gv2E)
// ASSERT: scan-not Int64 = Load(%1)
// ASSERT: scan Apply(@CJ_CORE_PrintSigned, %3
// ASSERT: scan Add(%3, %3)

var gv1 = 1;
var gv2 = 2

func foo() {
    var x = gv1
    println(x)
    var a = x + x
    x = gv2
    var b = x
}

main() {
    foo();
    0
}
