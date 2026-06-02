/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a01_04

  @Level:         1

  @Assertion: 6.1.2(1)
              A class consists of the following members:
              • members inherited from its superclass (if there is);
              • members of the interfaces that are implemented by the class, if there are;
              • members declared or defined in the class, including static initializer, primary constructor, 
                init constructors, static member variables, instance member variables, static member functions, 
                instance member functions, static member properties or instance member properties.

  @Description: Check that constructors and a static initializer declared in a class are members of the class
                by checking that they can access private variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006136

*/

import utils.assert.Assert

var call_indicator = 0

class Test {
  static let test_var = 17

  static init() {
    let a = test_var
    Assert.equals(17, a)
    call_indicator = 1
  }

  Test() {
    let a = test_var
    Assert.equals(17, a)
    call_indicator++
  }

  init(x: Int64) {
    let a = test_var
    Assert.equals(17, a)
    call_indicator++
  }
}

main() {
  Assert.equals(1, call_indicator)

  let t1 = Test()
  Assert.equals(2, call_indicator)

  let t2 = Test(15)
  Assert.equals(3, call_indicator)
}
