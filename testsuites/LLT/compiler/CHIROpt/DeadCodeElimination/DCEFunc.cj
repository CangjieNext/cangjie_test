// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %dumpCHIRDebug %disableCodegen  -Woff all %f -o %n.%suffix 2>&1 | compare %f

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

// ASSERT: scan [DCE] The @_CN7default1S3gooHv function of default package at [15,5] has been deleted
// ASSERT: scan [DCE] The @_CN7defaultUDCEFunc$3addHll function of default package at [20,1] has been deleted
