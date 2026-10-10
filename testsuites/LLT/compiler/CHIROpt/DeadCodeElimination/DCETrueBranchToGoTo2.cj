// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ConstantPropagation.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Const or-pattern match folded; MultiBranch rewritten.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not MultiBranch(
// ASSERT: scan Constant(0i)

main() {
    return match (3) {
        case 1 | 2 | 3 => 0
        case _ => 2
        case 4 => 3
        case _ => 4
    }
}
