/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_02_a01_04

  @Level:         1

  @Assertion:    2.1.2(1) The Cangjie programming language uses Rune to represent characters type.
   A value of type Rune is a Unicode code point. Characters can be classified into printable characters,
   non-printable characters (such as control characters), and special characters 
   (such as single quotation marks and backslashes).
 
  @Description:  Check that Rune type can contain lower case English alphabet

  @Mode:         run 

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
  let alphabet = [r'a', r'b', r'c', r'd', r'e', r'f', r'g', r'h', r'i', r'j', r'k', r'l', r'm', r'n', r'o', r'p', r'q', 
    r'r', r's', r't', r'w', r'x', r'y', r'z']
  for (char in alphabet) {
    var a: Rune
    a = char
    Assert.equals(char, a)
  }
}
