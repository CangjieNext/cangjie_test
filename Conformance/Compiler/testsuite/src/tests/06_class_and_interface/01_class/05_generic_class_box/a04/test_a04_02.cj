/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a04_02

  @Level:         1

  @Assertion: 6.1.5(4)
              Variables declared by let are not allowed to change the value
              of the wrapped variable when wrapping through them.

  @Description: Check that an immutable variable of the class Box can not be reassigned

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006303

  @Comment: The meaning of this assertion is vague.
            Does it mean the usual "immutable variables can't be reassigned",
            or does it mean "if the variable is immutable, 'value' field can not be changed".
            For now the first meaning is tested, might need to change the tests after resolution of 6303

*/

main() {
    let case1 = Box<Int64>(1)
    case1 = Box<Int64>(2)
}