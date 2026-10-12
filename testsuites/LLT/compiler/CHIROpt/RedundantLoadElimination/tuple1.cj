// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not Tuple(Int64,Rune) = Load(%1)
// ASSERT: scan Field(%12, 1) // loc: "tuple1.cj"-22-5

func goo(x: (Int64, Rune)) {
    println(x[1])
}

func foo() {
    var a = (1, r'a')
    println(a[0])
    a = (1, r'b')
    goo(a)
}

main() {
    foo();
    0
}
