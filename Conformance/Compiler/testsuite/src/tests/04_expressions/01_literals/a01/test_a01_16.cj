
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_16

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks value and type of the string literals. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var str1 = "Hello World"
    Assert.isTrue(str1 is String)
    Assert.equals("Hello World", str1)

    var str2 = "single-line string literal with escaped 't'\tcharacter"
    Assert.isTrue(str2 is String)
    Assert.equals("single-line string literal with escaped 't'\tcharacter", str2)
    
    var str3 = """
111
222
333
444
555"""
    Assert.isTrue(str3 is String)
    Assert.equals("111\n222\n333\n444\n555", str3)
}
