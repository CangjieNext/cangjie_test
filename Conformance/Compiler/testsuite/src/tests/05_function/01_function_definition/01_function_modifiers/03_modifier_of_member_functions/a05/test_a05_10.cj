/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a05_10

  @Level:         1

  @Assertion:     5.1.1.3(5) If no accessibility modifier is provided, member functions other than interface member
                  functions can only be accessed within the current package, and interface member functions are
                  public semantically by default.

  @Description:   Check that class member function defined with private modifier can't be accessed outside
                  own package.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
package pkg1
import mod_05_01_01_03_a05.pkg.myClass as myClass

main() {
  var myClassImpl = myClass()
  let myLet = myClassImpl.myPrivateFunc()
}
