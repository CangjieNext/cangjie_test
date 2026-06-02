/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_01_a07_02

  @Level:         1
  @Assertion:       2.1.8.1(7) 
                    let range9 = 0..10: 0 // error: The value of the step should not be zero.
                    let range10 = 0..=10: 0 // error: The value of the step should not be zero.

  @Description:     Checks that declarations work as expected.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single

*/

main() {
  let range10 = 0..=10: 0
  return 0
}
