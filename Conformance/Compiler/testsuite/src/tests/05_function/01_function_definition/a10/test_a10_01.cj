/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a10_01

  @Level:         1

  @Assertion:     5.1(10) The return type of the function can be declared explicitly using the syntax of : type 
                  following the parameters. Alternatively, it can be omitted and inferred by the compiler.

  @Description:   Check that function declaration with right syntax including required function name will not 
                  produce error.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert
type myType = (Int64, Rune, Bool)

interface myInterface { 
  func intefaceFunc1(): Int32
} 

public func checkingFunc<T>(x: T):String {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

class myClass <: myInterface {
  public var myPublicVar = "myPublicVarValue"
  private var myPivateVar:Int32 = 12
  var myVar:Float32 = 2.0
  myClass(){}

  public override func intefaceFunc1() { this.myPivateVar }

  func myClassFunc(inVal:Float32){
    this.myVar = inVal
  }
  public func getValues(){
    """
    Values are:"""
  }
  private func myPrivateFunc0():myType{
    (12,r'H',true)
  }
  private func myPrivateFunc(){
    "private => ${myPivateVar}"
  }
  protected func myProtectedFunc(){
    r'C'
  }
  static func myStaticFunc():Int32{
    12
  }
  func checkFuncRetTypes(){
    Assert.isTrue(this.myProtectedFunc() is Rune)
    Assert.isTrue(this.myPrivateFunc0() is myType)
    Assert.isTrue(this.myPrivateFunc() is String)
  }
}
func myParentFunc(){
  func myChildFunc():Int64{
    12
  }
  var myRetVal = myChildFunc()
  Assert.isTrue(myRetVal is Int64)
  "${myChildFunc()}"
}
main() {
  Assert.isTrue(myParentFunc() is String)

  Assert.isTrue(myClass.myStaticFunc() is Int32)
  var myClassImpl = myClass()
  Assert.isTrue(myClassImpl.intefaceFunc1() is Int32)
  Assert.isTrue(myClassImpl.getValues() is String)
  Assert.isTrue(myClassImpl.myClassFunc(12.77) is Unit)
  myClassImpl.checkFuncRetTypes()
  Assert.isTrue(myClassImpl.checkFuncRetTypes() is Unit)
}
