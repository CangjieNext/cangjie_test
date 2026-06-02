/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_a02_01

  @Level:         1

  @Assertion:     5(2)  In the Cangjie programming language, a function is a first-class citizen, that is, a function 
                  can be assigned to a variable, passed as a parameter, or returned as a value.

  @Description:   Check that different variants of function usage: 
                    variable assignment
                    passing as parameter
                    as return value

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

class myClass {
  private var myPrivateClassMember = ""

  myClass(inVal:String) {
    this.myPrivateClassMember = inVal
  }

  private func getPrivateValue() {
    this.myPrivateClassMember
  }

  func getClassMemberVal() {
    getPrivateValue()
  }

}

func myStringFunc() {
  "Result is: "
}

func myMultFunc(a:Int32,b:Int32):Int32 {
  a*b
}

func getResultOfMult(a:Int32, b: () -> String): String {
  var c:Int32 = 10
  return b() + myMultFunc(a,c).toString()
}

func parentFunc() {
  var parentVar:Float32 = 15.3
  func childFunc(in_val: Float32) {
    "As expected ${in_val}"
  }
  return childFunc(parentVar)
}

func myFuncReturnedAnotherFunc() {
  myStringFunc
}

main() {
  Assert.equals(myStringFunc(), "Result is: ")

  var funcResult = myMultFunc(3,4)
  Assert.equals(12, funcResult)

  var funcVar = myMultFunc
  Assert.equals(5, funcVar(1,5))

  let myRes = getResultOfMult(1,myStringFunc)
  Assert.equals("Result is: 10", myRes)

  var myRetVal = myFuncReturnedAnotherFunc()
  Assert.equals("Result is: ", myRetVal())

  var myInitParam:String = "my local class private member value"
  let myClassImpl = myClass(myInitParam)
  Assert.equals(myInitParam, myClassImpl.getClassMemberVal())

  let funcSub: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a - b}  
  Assert.equals(5, funcSub(12,7))

  Assert.equals("As expected 15.300000", parentFunc())
}
