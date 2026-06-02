
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a04_03

  @Level:         1

  @Assertion:   16.2(4) 2.Array literals (cannot be of type Array) and tuple literals whose elements are all const.
  @Description: Checks that a tuple literal which contains a let variable cannot be a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

main() {
    let x = 1
    const t = (1, x)
    return 0
}
