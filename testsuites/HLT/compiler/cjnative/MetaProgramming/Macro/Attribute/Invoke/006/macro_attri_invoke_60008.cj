/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import test.*

interface A {
    func foo() {
        let a = @M[1-](1)
    }
    static func bar() {
        let a = @M[1==](1)
    }
    operator func +(y: A) {
        let a = @M[1!=](1)
    }
}

class Test <: A {}

main() {
    Test.bar()
    return 0
}
