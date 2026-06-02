/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_04_a01_06

  @Level:         1
  @Assertion:    3.4.1.4(1) The protected access modifier protected is an access
                 level between default and public. The members declared as protected
                 can be accessed not only inside the package, but also outside the
                 package for the current class subclasses.

  @Description:  Tests protected members can't be accessed outside the package (not from sub-class)

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a01.cj

*/

package pkg2

import pkg1.*

main() {
    A().p
}
