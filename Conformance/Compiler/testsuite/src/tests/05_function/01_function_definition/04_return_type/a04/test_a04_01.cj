/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a04_01

  @Level:         1

  @Assertion:     5.1.4(4) The return type of a function can be specified using the :Type syntax after the parameter 
                  lists of the function definition. In this case, the type of the function body and the type of e in 
                  return e expressions in the function body are required to be subtypes of the annotated type (i.e., 
                  Type), otherwise a compilation error is raised. 

  @Description:   Check that return expression can have type eqauls to function return type or its subtype.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {}

type myType = Int64
extend myType {
  func toStringExtended() {
    "toString extended"
  }
}

struct myStruct0 <: myInterface {}
struct myStruct1 <: myInterface {}

enum myEnum0 <: myInterface { A }
enum myEnum1 <: myInterface { B }

open class myClass0 {}
class myClass1 <: myClass0 {}

func myFunc0(flag: Bool): Int64 {
  var myVar0: Int64 = 5
  var myVar1: myType = 5
  if(flag) {
    return myVar0
  }
  return myVar1
}

func myFunc1(flag: Bool): myInterface {
  var myVar0: myStruct0 = myStruct0()
  var myVar1: myStruct1 = myStruct1()
  if(flag) {
    return myVar0
  }
  return myVar1
}

func myFunc2(flag: Bool): myInterface {
  var myVar0: myEnum0 = myEnum0.A
  var myVar1: myEnum1 = myEnum1.B
  if(flag) {
    return myVar0
  }
  return myVar1
}

func myFunc3(flag: Bool): myClass0 {
  var myVar0: myClass0 = myClass0()
  var myVar1: myClass1 = myClass1()
  if(flag) {
    return myVar0
  }
  return myVar1
}

main() {
  Assert.isTrue(myFunc0(true) is Int64)
  Assert.isTrue(myFunc0(false) is Int64)
  Assert.isTrue(myFunc0(false) is myType)

  Assert.isTrue(myFunc1(true) is myStruct0)
  Assert.isTrue(myFunc1(true) is myInterface)
  Assert.isTrue(myFunc1(false) is myStruct1)
  Assert.isTrue(myFunc1(false) is myInterface)

  Assert.isTrue(myFunc2(true) is myEnum0)
  Assert.isTrue(myFunc2(true) is myInterface)
  Assert.isTrue(myFunc2(false) is myEnum1)
  Assert.isTrue(myFunc2(false) is myInterface)

  Assert.isTrue(myFunc3(true) is myClass0)
  Assert.isTrue(myFunc3(false) is myClass0)
  Assert.isTrue(myFunc3(false) is myClass1)
}
