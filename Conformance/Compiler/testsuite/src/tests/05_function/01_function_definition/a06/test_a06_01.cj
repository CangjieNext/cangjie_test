/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a06_01

  @Level:         1

  @Assertion:     5.1(6) The function name is followed by one or more parameters of the function. Each parameter is enclosed by (). For details, see Parameters

  @Description:   Check different variants of function definition with parameters list.

  @Mode:          run

  @Negative:      no

  @Structure:     single

  @Issue:         6131

*/
import utils.assert.Assert

class myClass{
  var myPublicVar1: Int32 = 34
  var myPublicVar2: Int32 = 62
  myClass(){}
  func toString(){
    "var1: ${this.myPublicVar1} var2: ${this.myPublicVar2} "
  }
  func updatePublic1(inVal:Int32){
    this.myPublicVar1 = inVal
  }
  func updateBothPublic(inVal0:Int32,inVal1:Int32){
    this.myPublicVar1 = inVal0
    this.myPublicVar2 = inVal1
  }
}
func concatOneTypeValues<T>(x: T, y: T):String where T <: ToString {
  return "${x.toString()} ${y.toString()}"
}
func myFuncWoParameters(){
  "myFuncWoParameters"
}
func myFuncWithOneParameter(inVal:Int32){
  inVal * 2
}
func myFuncWithThreeParameters(inVal0:Int32,inVal1:Int32,inVal2:Bool){
  if(inVal2){
    inVal0
  }else{
    inVal1
  }
}

main() {
  Assert.equals(concatOneTypeValues("A", "b"),"A b")
  Assert.equals(concatOneTypeValues(12, 7),"12 7")

  Assert.equals(myFuncWoParameters(),"myFuncWoParameters")
  Assert.equals(myFuncWithOneParameter(16),32)

  Assert.equals(myFuncWithThreeParameters(3,17,true),3)
  Assert.equals(myFuncWithThreeParameters(3,17,false),17)

  var myClassImpl = myClass()
  Assert.equals(myClassImpl.toString(),"var1: 34 var2: 62 ")
  myClassImpl.updatePublic1(16)
  Assert.equals(myClassImpl.toString(),"var1: 16 var2: 62 ")
  myClassImpl.updateBothPublic(7,99)
  Assert.equals(myClassImpl.toString(),"var1: 7 var2: 99 ")
}
