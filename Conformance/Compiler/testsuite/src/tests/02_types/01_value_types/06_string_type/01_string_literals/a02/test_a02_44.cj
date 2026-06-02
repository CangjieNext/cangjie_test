/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a02_44

  @Level:         1

  @Assertion:    2.1.6.1(2) A single-line string literal consists of zero or more characters (except non-escaped 
                 character " and alone character \) enclosed by a pair of double quote character (i.e., ").
                 Furthermore, a single-line string literal can only be written on the same line.

  @Description:  Immutable private class member single-line string variable in 4 lines.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

class myClass{
  private let myPrivateLetSingleLine: String = "
wet
    wea45y6wsr
  "
}

main() {
}