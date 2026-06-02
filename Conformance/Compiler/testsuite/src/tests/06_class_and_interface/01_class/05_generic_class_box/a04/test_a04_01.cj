/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a04_01

  @Level:         1

  @Assertion: 6.1.5(4)
              Variables declared by let are not allowed to change the value
              of the wrapped variable when wrapping through them.

  @Description: Check that immutable variables of the Box class can be assigned once

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006303

  @Comment: The meaning of this assertion is vague.
            Does it mean the usual "immutable variables can't be reassigned",
            or does it mean "if the variable is immutable, r'value' field can not be changed".
            For now the first meaning is tested, might need to change the tests after resolution of 6303

*/

import utils.assert.Assert

main() {
    let case1 = Box<Int64>(1)
    let case2 = Box<String>("")
    let case3: Box<Rune>
    case3 = Box<Rune>(r'c')
    let case4: Box<Bool>
    case4 = Box<Bool>(true)
    let case5 = case4
    let case6: Box<String>
    case6 = case2

    Assert.equals(1, case1.value)
    Assert.equals("", case2.value)
    Assert.equals(r'c', case3.value)
    Assert.equals(true, case4.value)
    Assert.equals(true, case5.value)
    Assert.equals("", case6.value)
}