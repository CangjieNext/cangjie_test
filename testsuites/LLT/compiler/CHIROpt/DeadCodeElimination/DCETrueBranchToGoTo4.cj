// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ConstantPropagation.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Nested const if folded; Branch rewritten to straight-line return.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not Branch(
// ASSERT: scan Constant(0i)

main(): Int64 {
    if (true) {
        if (false) {
            0
        } else if (true) {
            1
        } else if (false) {
            2
        } else {
            3
        }
    } else {
        -1
    }
    return 0
}
