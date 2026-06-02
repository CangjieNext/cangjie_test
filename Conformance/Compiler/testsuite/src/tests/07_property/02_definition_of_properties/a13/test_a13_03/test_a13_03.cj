/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a13_03

  @Level:         1

  @Assertion:   7.2(13) Properties do not support overloading or shadowing, and cannot be
                renamed with other members of the same level.

  @Description: Checks that property cannot be renamed.

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: test/aux_test_a13_03.cj
  @Issue:        0006124


*/

package test_a13_03

import test.AuxTestA1303.prop_x as a_prop_x

main() {
  let x = a_prop_x
  return 0
}



