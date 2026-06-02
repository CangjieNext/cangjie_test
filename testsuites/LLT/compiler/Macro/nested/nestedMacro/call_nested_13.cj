// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj macroBarAttr.cj
// EXEC: %compiler macroFoo.cj %cmp_macro
// EXEC: %compiler macroBarAttr.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args  

import pkg1.*
import pkg4.*

@Foo
@Foo
class Data {
    var a = @Foo(6)
    @Bar[let b = 3]
    let b = 2
    @Foo(let c = @Foo(4*2))
    @Foo(let d = @Bar[3*3](2021))

    func getA(): Int64 {
        return a
    }

    func getB() {
        return b
    }

    @Foo
    func getC() {
        return c
    }

    @Foo(
  @Bar[func getD() {
    return d
  }](return 3))
}

main(): Int64 {
    var data = Data()
    var a = data.getA()
    var b = data.getB()
    var c = data.getC()
    var d = data.getD()
    if (a != 6 || b != 3) {
        return 1
    }
    if (c != 8 || d != 9) {
        return 1
    }
    0
}
