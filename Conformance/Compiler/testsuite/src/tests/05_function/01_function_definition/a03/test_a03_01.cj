/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a03_01

  @Level:         1

  @Assertion:     5.1(3) A function declaration may start with function modifiers that precede the keyword func.

  @Description:   Check that function declaration may use function modifiers that precede the keyword func.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface { 
  func getSomething(): Int32
} 

public func f1<T>(x: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

open class C1 {
  public open func sayHelloWorld() {
    "HelloWorld"  }
}

class myClass <: C1 & myInterface {
  public var myPublicVar = "myPublicVarValue"
  private var myPivateVar:Int32 = 12
  var myVar:Float32 = 2.0

  public override func getSomething() { 
    this.myPivateVar 
  }

  public override func sayHelloWorld() { 
    var tmpVar = super.sayHelloWorld()
    "${tmpVar} is overrided with\nByeByeWorld"
  }

  func myClassFunc(inVal:Float32) {
    this.myVar = inVal
  }

  public func getValues() {
    """
    Values are:
      public => this.myPublicVar
      ${this.getPrivateVal()}"""
  }

  private func getPrivateVal() {
    "private => ${myPivateVar}"
  }
  protected func myProtectedFunc() {
    "myProtectedFunc"
  }

  static func myStaticFunc(): Int32 {
    12
  }
}

main() {
  var myVar1:Int64 = 22
  Assert.equals("x is Int64",f1(myVar1))
  Assert.equals("x is not Int64",f1('C'))

  Assert.equals(12,  myClass.myStaticFunc())

  let myClassImpl = myClass()
  Assert.equals(12,  myClassImpl.getSomething())
  Assert.equals("""
    Values are:
      public => this.myPublicVar
      private => 12""",  myClassImpl.getValues())  
  Assert.equals("""
HelloWorld is overrided with
ByeByeWorld""",  myClassImpl.sayHelloWorld())       
}
