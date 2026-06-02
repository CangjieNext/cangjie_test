/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a01_01

  @Level:         1

  @Assertion:     5.1.1.3(1) Class member functions can have the following modifiers: public, protected, private, 
                  static, open, override and redef. For details, see Class Members.

  @Description:   Check that class member function definition may use function modifiers: public, protected, private, 
                  static, open, override and redef.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
  func myFuncFromInterface(): String
}

open class myOpenClass {
  open public func myOpenClassOpenFunc(inVal: Int64) { inVal*2 }
  static func func1() { "func1 from myOpenClass" } 
}

class myClass1 <: myOpenClass {
  redef static func func1() { "func1 redefined in myClass1" } 
}

class myClass2 <: myInterface {
  private let myPrivateLet: Int32 = 762
  protected var myProtectedLet: Int32 = 267

  static func myStaticFunc() {
    "this is myClass2 static func"
  }

  public override func myFuncFromInterface() {
    "result of function overriding"
  }

  public func myPublicFunc() {
    return """
      private: ${this.myPrivateFunc()}
      protected: ${this.myProtectedFunc()}"""
  }

  private func myPrivateFunc() {
    this.myPrivateLet
  }

  protected func myProtectedFunc() {
    this.myProtectedLet
  }

}

main() {
  Assert.equals("func1 from myOpenClass",myOpenClass.func1())
  Assert.equals("func1 redefined in myClass1",myClass1.func1())
  Assert.equals("this is myClass2 static func",myClass2.myStaticFunc())
  
  var myClass2Impl = myClass2()
  Assert.equals("result of function overriding",myClass2Impl.myFuncFromInterface())
  Assert.equals("""
      private: 762
      protected: 267""",myClass2Impl.myPublicFunc())
}
