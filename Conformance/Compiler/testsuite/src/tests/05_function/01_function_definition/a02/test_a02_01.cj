/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a02_01

  @Level:         1

  @Assertion:     5.1(2) A function is declared with the keyword func.

  @Description:   Check that different variants of function declaration with keyword func.

  @Mode:          compileonly

  @Negative:      no

  @Structure:     single

*/
interface myInterface { 
  static func f(): String 
} 

public func f1<T>(x: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

func f2(a:Float16, b!:Float16){
  return a/b
}

func f3(a:Float16, b!:Float16 = 2.0){
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

main() {
}
