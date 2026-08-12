// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Successful TryNumericCast folded to Constant + GoTo.
// ASSERT: scan GoTo(#
// ASSERT: scan-not TryNumericCast(
// ASSERT: scan Constant(127i)

let gv: Int16 = 127

func foo() {
    try {
        Int8(gv)
    } catch (_) {
        Int8(16)
    }
}

main() {
    foo()
    0
}
