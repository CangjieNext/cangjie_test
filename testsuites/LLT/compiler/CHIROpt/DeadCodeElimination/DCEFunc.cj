// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_UselessFuncElimination.chirtxt" WHOLE | compare %f
// RUN-EXEC-PIPE-0: %run main
// Unused private S.goo / add deleted; main kept.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not srcCodeIdentifier: goo
// ASSERT: scan-not srcCodeIdentifier: add

struct S {
    var x: Int64 = 1
    mut func foo() {
        x = 2
    }
    private func goo() {
        x
    }
}

private func add(a: Int64, b: Int64) {
    return a + b
}

main() {
    var s = S()
    s.foo()
}
