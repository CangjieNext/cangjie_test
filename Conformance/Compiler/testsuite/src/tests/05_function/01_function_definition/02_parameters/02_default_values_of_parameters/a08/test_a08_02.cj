/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a08_02

  @Level:         1

  @Assertion:     5.1.2.2(8) The name introduced in the default value of a function parameter is obtained from the 
                  static scope, that is, the names introduced by default value is the names that can be accessed when 
                  the function is defined. 

  @Description:   Check that non-static variable can't be used as default value for static func.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
class myClass {
  let myClassMemberVar: String = "default value"

  static func print(s!: String = myClassMemberVar): String { s }
}
 
main() {
}
