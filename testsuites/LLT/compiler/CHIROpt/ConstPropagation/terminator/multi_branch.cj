// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Const match selector folded; default arm kept.
// ASSERT: scan GoTo(#
// ASSERT: scan-not MultiBranch(
// ASSERT: scan Constant("green")
// ASSERT: scan-not Constant("red")

func foo() {
    var x = 34
    match (x) {
        case 1 => println("red")
        case 2 => println("blue")
        case _ => println("green")
    }
}

main() {
    foo()
    0
}
