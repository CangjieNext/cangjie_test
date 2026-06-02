/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a08_03

  @Level:         1

  @Assertion:   7.1(8) In particular, properties in struct, like fields declared with let,
                cannot be assigned values when an instance of struct is declared using let.

  @Description: Checks that struct with mut property can be set when declared via var.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

struct Foo {
  var pv: Int64 = 0
  mut prop a: Int64 {
    get() {
      pv
    } 
    set(v) { pv = v } 
  }
}

main() {
  var x = Foo()
  x.a = 3
  Assert.equals(3, x.a)
  return 0;
}


