/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a08_01

  @Level:         1

  @Assertion:     5.1(8) Multiple parameters are separated by comma.

  @Description:   Check different variants of function definition with multiple parameters.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFuncWithOneParameter(inVal:Int32){
  inVal + 43
}
func myFuncWithThreeParameters(inVal0:Int32,inVal1:Int32,inVal2:Bool){
  if(inVal2){
    inVal0
  }else{
    inVal1
  }
}
func myFuncWithSixParameters(inVal0:Int32,inVal1:Int32,inVal2:Bool,inVal3:UInt16,inVal4:Float32,inVal5:Bool):String{
  """
  list of params:
  inVal0:${inVal0},inVal1:${inVal1},inVal2:${inVal2},inVal3:${inVal3},inVal4:${inVal4},inVal5:${inVal5}"""
}
func parentFunc(a:Float32,b:Float32):String{
  func nestedFunc0(a:Float32,b:Float32):Float32{
    a+b
  }
  func nestedFunc1(a:Float32,b:Float32,c:Float32):Float32{
    a+b-c
  }
  func nestedFunc2(a:Float32,b:String):String{
    "${b} ${a.toString()}"
  }
  nestedFunc2(nestedFunc1(a,b,nestedFunc0(a,b)),"result is ")
}
main() {
  Assert.equals(myFuncWithOneParameter(16),59)

  Assert.equals(myFuncWithThreeParameters(6,-97,true),6)
  Assert.equals(myFuncWithThreeParameters(6,-97,false),-97)
  let myLet = myFuncWithSixParameters(12,22,true,5,2.38,false)
  Assert.equals(myLet,"""
  list of params:
  inVal0:12,inVal1:22,inVal2:true,inVal3:5,inVal4:2.380000,inVal5:false""")

  Assert.equals(parentFunc(8.9,17.40),"result is  0.000000")
}
