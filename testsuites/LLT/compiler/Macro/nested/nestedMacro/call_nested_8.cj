// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj macroFooAttr.cj
// EXEC: %compiler macroFoo.cj %cmp_macro
// EXEC: %compiler macroFooAttr.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

import pkg1.*
import pkg2.*

@Foo
struct Data {
    @Foo[let a = 1]
    let a = 100
    let b = 2

    func getA() {
        return a
    }

    @Foo
    func getB() {
        return b
    }
}

main(): Int64 {
    @Foo var data = Data()
    var a = data.getA()
    var b = data.getB()
    if (a != 1 || b != 2) {
        return 1
    }
    0
}
