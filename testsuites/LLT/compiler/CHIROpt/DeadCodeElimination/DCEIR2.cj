// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_EraseUselessDebugExpr.chirtxt" "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Unused Add/compare cleaned; only constants remain.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not Add(
// ASSERT: scan Constant(0i)

main() {
    var x: Int32 = 1
    var y = x + x
    var z: Float32 = 2.3
    (z + z) > 0.1
    0
}
