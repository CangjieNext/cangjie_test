/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_01_a02_02

  @Level:         1
  @Assertion:    3.4.1.1(2) Note: Members not modified with keywords are
                 inaccessible outside the package.

  @Description:  Checks that class with default access modifier defined
                 in upper package is not visible in child sub-package.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a02_02.cj

*/

package parent.pack1

import parent.*

main() {
    var a = A()
}
