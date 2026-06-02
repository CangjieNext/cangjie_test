/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a16_01

  @Level:         1

  @Assertion:       2.1.11.5(16) The question mark operator (?) is a postfix unary operator. 
  The ? shall be used with the postfix operators ., () and [] in order to make 
  option types support for these postfix operators.

  @Description:     Checks value of Option coalescing expressions for simple values

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

main() {
    var a = Some(123) ?? 321
    Assert.equals(123, a)
    let b = None<Rune> ?? r'f'
    Assert.equals(r'f', b)
}
