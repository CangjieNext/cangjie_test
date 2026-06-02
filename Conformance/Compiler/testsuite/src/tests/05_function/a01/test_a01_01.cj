/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_a01_01

  @Level:         1

  @Assertion:     5(1) A function is a block of program code that deals with a specific task.
A function can be identified and invoked through a name.

  @Description:   Check that different variants of function usage.

  @Mode:          run

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
import utils.assert.Assert
import pkg.AuxModule as outideClass
import pkg.myCalcFunc as outideFunc

class myLocalClass {
  private var myPrivateClassMember = ""
  myLocalClass(inVal:String) {
    this.myPrivateClassMember = inVal
  }
  func getClassMemberVal(){
    return this.myPrivateClassMember
  }
}

func myStringFunc(){
  "Result is: "
}
func myMultFunc(a:Int32,b:Int32):Int32 {
  a*b
}
func getResultOfMult(a:Int32):String{
  var b:Int32 = 10
  return myStringFunc() + myMultFunc(a,b).toString()
}

func parentFunc(){
  var parentVar:Float32 = 15.3
  func childFunc(in_val:Float32){
    "As expected ${in_val}"
  }
  return childFunc(parentVar)
}
func myTestFunc(a:Int32){
  a*2
}
func myTestFunc(a:Int32,b:Int32){
  a*b
}
main() {
  var funcResult = outideFunc(2,7)
  Assert.isTrue(funcResult == 9)

  var myClass = outideClass()
  var classFuncResult = myClass.myClassFunc()
  Assert.equals("return from class func", classFuncResult)

  Assert.equals(myStringFunc(), "Result is: ")

  var anotherFuncResult = myMultFunc(3,4)
  Assert.equals(12, anotherFuncResult)

  let myRes = getResultOfMult(1)
  Assert.equals("Result is: 10", myRes)

  var myInitParam:String = "my local class private member value"
  let myClassImpl = myLocalClass(myInitParam)
  Assert.equals(myClassImpl.getClassMemberVal(), myInitParam)

  let funcSub: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a - b}
  Assert.equals(funcSub(12,7), 5)

  Assert.equals(parentFunc(), "As expected 15.300000")

  Assert.equals(myTestFunc(10),myTestFunc(10,2))
}
