// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %f -g %dumpCHIRDebug -o %output
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC-PIPE: sed -E -n '/Func @_CN7default3fooHll/,/Func @/p' testDCEfor05_CHIR/0_AST_CHIR.chir | sed '$d' | compare %f
// (Linux and not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: sed -E -n '/Func @_ZN7default3fooEll/,/Func @/p' testDCEfor05_CHIR/0_AST_CHIR.chir | sed '$d' | compare %f

func foo(a: Int64, b: Int64) {
    if (a <= b) {
    } else {
    }

    if (a <= b) {
    }
}

main() {
    let a = 1
    let b = 2
    foo(a, b)
}

// ASSERT: regex-begin %\d+: Unit = Constant\(unit\) // loc: "testDCEfor05.cj"-12-5, scope: 0
// ASSERT: regex-next %\d+: Unit = Store\(%\d+, %\d+\) // loc: "testDCEfor05.cj"-12-5, scope: 0
// ASSERT: regex-next GoTo
// ASSERT: regex-next ^Block
// ASSERT: regex-next %\d+: Unit = Constant\(unit\) // loc: "testDCEfor05.cj"-12-5, scope: 0
// ASSERT: regex-next %\d+: Unit = Store\(%\d+, %\d+\) // loc: "testDCEfor05.cj"-12-5, scope: 0
// ASSERT: regex-next GoTo
// ASSERT: regex-next ^Block
// ASSERT: regex-next %\d+: Unit = Load\(%\d+\) // loc: "testDCEfor05.cj"-12-5, scope: 0, skip: dce warning
// ASSERT: regex-begin %\d+: Unit = Constant\(unit\) // loc: "testDCEfor05.cj"-16-5, scope: 0
// ASSERT: regex-next %\d+: Unit = Store\(%\d+, %\d+\) // loc: "testDCEfor05.cj"-16-5, scope: 0
