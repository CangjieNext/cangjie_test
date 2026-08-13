// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Successful Try* with const operands folded to Constant + GoTo.
// ASSERT: scan GoTo(#
// ASSERT: scan-not TryAdd(
// ASSERT: scan-not TrySub(
// ASSERT: scan-not TryRShift(
// ASSERT: scan Constant(27i)
// ASSERT: scan Constant(125i)
// ASSERT: scan Constant(31i)

func foo() {
    try {
        let a: Int8 = 127
        let b: Int8 = -100
        let c: Int8 = 2
        a + b
        a - c
        a >> c
    } catch (_) {
        Int8(16)
    }
}

main() {
    foo()
    0
}
