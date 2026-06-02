/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_a03_01

  @Level:         1
  @Assertion:       2.1.8(3) Range is an immutable type that represents an sequence of elements
                    with fixed step value.

  @Description:     Checks that range is an immutable type.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single

*/

main() {
  let a1 = 0..=9
  a1 = 0..10
  return 0
}
