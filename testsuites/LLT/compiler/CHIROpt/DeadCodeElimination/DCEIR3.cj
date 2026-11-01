// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %overflowOpt %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_UselessExprElimination.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// Negative shift is kept in CHIR and throws at runtime; do not require exit 0.
// RShift with non-const shift amount must be kept (may throw).
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan RShift(

var gv1 = -2

main() {
    var x: Int32 = 1
    x >> gv1
    0
}
