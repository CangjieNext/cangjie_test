// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: regex-not core dumped
// ASSERT: regex fileID: 1 line: 31 column: *

import p1.*

@M1
class A {
    var a: Int32 = 1
    var b = 1

    @M2
    func getA(): Int32 {
        return a
    }

    func getA2() {
        return a
    }

    func foo() {
        let f = 42
        return "foo"
    }
}

main() {
    0
}
