/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a05_01

  @Level:         1

  @Assertion:     5.1.1.3(5) If no accessibility modifier is provided, member functions other than interface member 
                  functions can only be accessed within the current package, and interface member functions are 
                  public semantically by default. 

  @Description:   Check that member function defined without public modifier can be accessed inside own package only.

  @Mode:          run

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

  @Module:        mod_05_01_01_03_a05

*/
package pkg
import utils.assert.Assert

main() {
  Assert.equals("myInterfaceStaticFunc return",myInterface.myInterfaceStaticFunc())
  Assert.equals("this is myClass static func",myClass.myStaticFunc())
  Assert.equals("this is a myStructStaticFunc func return value",myStruct.myStructStaticFunc())
  Assert.equals("myEnumStaticFunc",Color.myEnumStaticFunc())

  var myColor = Color.RED
  Assert.equals("#FF0000",myColor.getColor())

  let myStructImpl = myStruct()
  Assert.equals("this is a myStructFunc func return value",myStructImpl.myStructFunc())

  var myClassImpl = myClass()
  Assert.equals("""
      private: 762
      protected: 267""",myClassImpl.myPackagePrivateFunc())
}
