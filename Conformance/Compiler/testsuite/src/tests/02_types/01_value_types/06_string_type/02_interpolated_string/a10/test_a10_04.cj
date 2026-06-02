/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a10_04

  @Level:         1

  @Assertion:    2.1.6.2(10) Interpolation expressions also support user-defined types, as long as the type implements the ToString interface.

  @Description:  Check that user-defined types without implemented ToString interface can't be used in interpolation expressions: 
                  class without func toString.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/
class myClass {
  var myVar = "AAA"
  myClass() {}
}
main() {
  var myClassImpl = myClass()
  let myExpr0 = "Here is ${myClassImpl}"
}