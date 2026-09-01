// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: TryInvoke of Comparable<= rewritten to builtin LE under -O2.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan LE(
// ASSERT: scan-not TryInvoke(

main() {
    let a: Comparable<Float64> = 1.1
    let r = try {
        if (a <= 2.2) {
            1
        } else {
            0
        }
    } catch (_: Exception) {
        0
    }
    r - 1
}
