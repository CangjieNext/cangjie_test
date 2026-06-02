/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_14

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that a let member variable named parameter in the primary constructor
                modified with 'private' creates a variable that is not visible from outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a14_aux.cj

*/

import a14_neg.*

main() {
  let tst = A14Aux(0, 0, 0, 0, 0, 0,
    prot_var_n: 0, prot_let_n: 0, priv_var_n: 0, priv_let_n: 0 ,var_n: 0 ,let_n: 0 )

  tst.priv_let_n
}