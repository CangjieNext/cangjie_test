/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a15_03

  @Level:         1

  @Assertion:     5.1.2.2(15) When a function is called by using a variable name, arguments cannot be optional.

  @Description:   Check that class member function called by using variable name, can't be called with optional 
                  argument.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

class myClass {
  func myClassFunc(b!: Int32 = 1): Int32 { b + 1 } 
}

main() {
  var myClassImpl = myClass()
  var aaa = myClassImpl.myClassFunc
  var retVal = aaa()
}
