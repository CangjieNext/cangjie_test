// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ConstantPropagation.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// while(true) + if(true) break folded; Branch rewritten.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not Branch(
// ASSERT: scan Constant(0i)

main(): Int64 {
    var i = 1
    var sum = 0
    while (true) {
        sum += i
        if (true) {
            break
        }
        i++
    }
    return 0
}
