// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: imported_pkg.cj
// EXEC-PIPE-0: %compiler %enableCompileDebug %compile_lib_opt imported_pkg.cj -o test.%middle
// EXEC: %compiler %f test.%middle -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan good

import test.*

interface I2 <: I1 {
    func foo() {
        var x = goo
        x()
    }
}

class A <: I2 {
    public static func goo() {
        println("good")
    }
}

main() {
    var x = A().foo
    x()
}
