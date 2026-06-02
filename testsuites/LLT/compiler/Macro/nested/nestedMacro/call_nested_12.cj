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
struct Data {
    @Bar[let a = 1]
    let a = 100
    let b = @Foo(@Bar[2](200))

    @Foo
    func getA() {
        return a
    }

    @Foo(
  @Bar[func getB() {return b}]
  func getB() {
    return b
  }
  )
}

main(): Int64 {
    var data = Data()
    var a = data.getA()
    var b = data.getB()
    if (a != 1 || b != 2) {
        return 1
    }
    0
}
