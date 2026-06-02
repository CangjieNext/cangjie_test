/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_01_a02_01

  @Level:         1
  @Assertion:    3.4.1.1(2) Note: Members not modified with keywords are
                 inaccessible outside the package.

  @Description:  Checks that function with default access modifier defined
                 in named package is not visible in named package.

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a02_01.cj

*/

package pack1

import pack2.*

main() {
    testFunc()
}
