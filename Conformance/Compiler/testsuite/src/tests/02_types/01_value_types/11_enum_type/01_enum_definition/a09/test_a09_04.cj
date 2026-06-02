/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a09_04

  @Level:         1
  @Assertion:       2.1.11.1(9) As custom types, enum types do not support == (and ! =) by default. Of course, it is
possible to override the == (or ! =) operator (see Section operator overloading) to make custom
enum types support == (or ! =).

  @Description:     Checks that it is possible to override the != operator

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

var count = 0;
enum E {
    | F | D

    func f () {count}
    operator func !=(e: E) { 
        return e.f() + this.f()
    }
}

main() {
    Assert.equals(0, F != F)
    Assert.equals(0, F != F)
    count = 1
    Assert.equals(2, F != D)
    count = 2
    Assert.equals(4, D != F)
    count = -1
    Assert.equals(-2, D != D)
}
