// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ConstantPropagation.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Nested const Rune match folded; MultiBranch rewritten.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not MultiBranch(
// ASSERT: scan Constant(0i)

main() {
    let c = r'a'
    let t = match (c) {
        case r'a' | r'b' | r'c' => match (c) {
            case r'a' => return 0
            case _ => return 2
        }
        case r'A' => return 2
        case r'C' => return 2
        case _ => return 2
    }
    return t
}
