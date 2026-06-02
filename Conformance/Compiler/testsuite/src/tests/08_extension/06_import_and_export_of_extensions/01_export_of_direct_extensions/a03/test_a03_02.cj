/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_01_a03_02

  @Level:         1

  @Assertion:       8.6.1(3) When the direct extension is in a different package from the definition of the type being 
                    extended, the extension is never exported and can only be used in the current package.

  @Description:     Check that extension defined in different package from the definition of the type being extended is
                    not accessible outside from own package; Case: type extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a03_02.cj

*/

package pkg3

import pkg1.*
import pkg2.*

main() {
    var myTypeVar: MyType = 12
    print(myTypeVar.myExtendFunc())
}
