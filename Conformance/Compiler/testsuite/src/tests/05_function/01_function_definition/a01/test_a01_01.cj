/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a01_01

  @Level:         1

  @Assertion:     5.1(1) In the Cangjie programming language, a function is defined with the following syntax. 
    functionDefinition 
              : functionModifierList? 'func' 
             identifier 
             typeParameters? 
             functionParameters 
              (':' type)? 
              (genericConstraints)? 
             block 
              ;

  @Description:   Check that different variants of function definition.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
package test_pkg

import utils.assert.Assert

interface myI {
  func myIFunc(): String 
}

class myClassWithI <: myI {
  public func myIFunc() {
    "myClassWithI.myIFunc() response "
  }
}

func myGenericFunc<T>(i: T): String where T <: myI {
  return i.myIFunc()
}


public func f0(): Unit {}

public func f1<T>(x: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

public func f2(a:Float32){
  return a
}

public func f2(a:Float16, b!:Float16){
  return a/b
}

public func f3(a:Float16, b!:Float16 = 2.0){
  return a/b
}

class myClass{
  public var myPublicVar = "myPublicVarValue"
  private var myPivateVar = 12
  myClass(){}
  func getValues(){
    """
    Values are:
      public => this.myPublicVar
      ${this.getPrivateVal()}"""
  }
  private func getPrivateVal(){
    "private => ${myPivateVar}"
  }
}

func parentFunc(){
  var parentVar:Float32 = 15.3
  func childFunc(in_val:Float32){
    "As expected ${in_val}"
  }
  childFunc(parentVar)
}

func anotherParentFunc(inVal:Int32):String{
  func childFunc(inVal:Int32){
    return "From childFunc: " + inVal.toString()
  }
  let childRet = childFunc(inVal)
  return "From parent -> ${childRet}"
}

main() {
  var myInt64Var: Int64 = 12
  var myUInt8Var: UInt8 = 7
  Assert.equals(f1(myInt64Var),"x is Int64")
  Assert.equals(f1(myUInt8Var),"x is not Int64")

  Assert.equals(f2(4.36),4.36)
  Assert.equals(f2(4.36,b:2.0),2.18)
  Assert.equals(f3(6.36,b:3.0),2.12)
  Assert.equals(f3(6.36),3.18)

  Assert.isTrue(parentFunc() == "As expected 15.300000")
  Assert.isTrue(anotherParentFunc(8) == "From parent -> From childFunc: 8")

  var myClassImpl = myClass()
  var expected = """
    Values are:
      public => this.myPublicVar
      private => 12"""
  Assert.isTrue(myClassImpl.getValues() == expected)

  let myClassWithIImpl = myClassWithI()
  Assert.equals("myClassWithI.myIFunc() response ",myGenericFunc(myClassWithIImpl))
}
