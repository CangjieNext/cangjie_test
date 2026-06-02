/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_25

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that a var member variable unnamed parameter in the primary constructor
                with no modifiers creates a variable that is not visible in a subclass from outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a14_aux.cj

*/

import a14_neg.*

class Child <: A14Aux {
  init() {
    super(0, 0, 0, 0, 0, 0, prot_var_n: 0, prot_let_n: 0, priv_var_n: 0, priv_let_n: 0 ,var_n: 0 ,let_n: 0)
  }

  static func test() {
    let tst = A14Aux(0, 0, 0, 0, 0, 0,
      prot_var_n: 0, prot_let_n: 0, priv_var_n: 0, priv_let_n: 0 ,var_n: 0 ,let_n: 0 )

    tst.var_u
  }
}

main() {
  Child.test()
}