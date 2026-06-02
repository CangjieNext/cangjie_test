/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a03_01

  @Level:         1

  @Assertion:    10.1.3.2(3)
                  open class Base {}
                  class Sub <: Base {}
                  func f(a!: Sub = Sub(), b!: Int32 = 2) {}           // This is f1
                  func f(a!: Base = Base()) {}         // This is f2.
                  var x1 = f(a: Sub()) // parameters involved in comparison in f1 is only a
 
  @Description:  Example from spec

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert


open class Base {}
class Sub <: Base {}
func f(a!: Sub = Sub(), b!: Int32 = 2) {
}           // This is f1
func f(a!: Base = Base()) {
    Assert.fail()
}         // This is f2.




main(ina :Array<String>) {
   var x1 = f(a: Sub()) // parameters involved in comparison in f1 is only a


    0
}

