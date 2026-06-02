/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_21

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Checks that a call of function with mut modifier some times mutates the member values.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

struct Foo {
    var i = 0
    mut func f() {
        this.i += 1
        i += 1
    }
}

main() {
    var a = Foo()
    Assert.equals(0, a.i)
    a.f()
    Assert.equals(2, a.i)
    a.f()
    Assert.equals(4, a.i)
    return 0
}
