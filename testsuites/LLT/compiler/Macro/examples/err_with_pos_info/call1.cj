// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: regex-not core dumped
// ASSERT: regex fileID: 1 line: 33 column: *

import p1.*

/**
 * Test: Print Position info when error happens
 * Libast always serialize position of Cangjie AST
 * So if that Token(tk) is from the source, then the macro
 * authors can rely on tk.pos to represent the source.
 */
@M1
class A {
    var a: Int32 = 1
    var b = 1

    @M2
    func getA(): Int32 {
        return a
    }

    @M2
    func getA2() {
        return a
    }

    func foo() {
        return "foo"
    }
}

main() {
    0
}
