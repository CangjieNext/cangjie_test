// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix -g 2>&1
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex-3 Unit = StoreElementRef.*loc: "storeElementRef02\.cj"

class A {
    var a = true
    func foo() {
        a &&= false
    }
    func foo1() {
        a ||= false
    }
}

main() {
    0
}
