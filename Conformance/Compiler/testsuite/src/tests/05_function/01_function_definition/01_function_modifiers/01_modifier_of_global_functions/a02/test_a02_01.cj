/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a02_01

  @Level:         1

  @Assertion:     5.1.1.1(2) public: The function can be accessed in other packages.

  @Description:   Check that top-level functions defined with 'public' modifier can be accessed inside own
                  package when is imported with all package.

  @Mode:          run

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
import utils.assert.Assert
import pkg as O

main() {
  Assert.equals("func myPublicFunc1 can be accessed in other package", O.myPublicFunc1())
  Assert.equals("func myPublicFunc2 can be accessed in other package", O.myPublicFunc2())
}
