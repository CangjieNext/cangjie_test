/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_02_a01_04

  @Level:         1
  @Assertion:       2.1.8.2(1) Range expressions can be used as a part of the for in expressions
                    (refer to Loop Expressions) or can be used as index for slicing.

  @Description:     Checks that range expression with step != 1 gives runtime exception when is used
                    as index for slicing.

  @Mode:            run
  @Negative:        yes
  @Structure:       single

  @Comment:

*/

main() {

  let array = [-3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8]
  array[0..5:2]

  return 0
}
