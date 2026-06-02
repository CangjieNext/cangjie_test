/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a09_01

  @Level:         1

  @Assertion:     5.1(9) The type of each parameter needs to be specified.

  @Description:   Check different variants of function definition with different type multiple parameters.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFuncWithOneParameter(inVal:Int32){
  Assert.isTrue(inVal is Int32)
  inVal
}
func myFuncWithThreeParameters(inVal0:Int32,inVal1:Int32,inVal2:Bool){
  Assert.isTrue(inVal0 is Int32)
  Assert.isTrue(inVal1 is Int32)
  Assert.isTrue(inVal2 is Bool)
  if(inVal2){
    inVal0
  }else{
    inVal1
  }
}
func myFuncWithSixParameters(inVal0:Int32,inVal1:Int32,inVal2:Bool,inVal3:UInt16,inVal4:Float32,inVal5:Bool):String{
  Assert.isTrue(inVal0 is Int32)
  Assert.isTrue(inVal1 is Int32)
  Assert.isTrue(inVal2 is Bool)
  Assert.isTrue(inVal3 is UInt16)
  Assert.isTrue(inVal4 is Float32)
  Assert.isTrue(inVal5 is Bool)
  """
  list of params:
  inVal0:${inVal0},inVal1:${inVal1},inVal2:${inVal2},inVal3:${inVal3},inVal4:${inVal4},inVal5:${inVal5}"""
}
func parentFunc(a:Float32,b:Float32):String{
  Assert.isTrue(a is Float32)
  Assert.isTrue(b is Float32)
  func nestedFunc0(c:Float32,d:Float32):Float32{
    Assert.isTrue(c is Float32)
    Assert.isTrue(d is Float32)
    c+d
  }
  func nestedFunc1(e:Float32,f:Float32,g:Float32):Float32{
    Assert.isTrue(e is Float32)
    Assert.isTrue(f is Float32)
    Assert.isTrue(g is Float32)
    e+f-g
  }
  func nestedFunc2(h:Float32,i:String):String{
    Assert.isTrue(h is Float32)
    Assert.isTrue(i is String)
    "${i} ${h.toString()}"
  }
  nestedFunc2(nestedFunc1(a,b,nestedFunc0(a,b)),"result is ")
}
main() {
  Assert.isTrue(myFuncWithOneParameter(16) is Int32)

  Assert.equals(myFuncWithThreeParameters(6,-97,true),6)
  Assert.equals(myFuncWithThreeParameters(6,-97,false),-97)
  let myLet = myFuncWithSixParameters(12,22,true,5,2.38,false)
  Assert.equals(myLet,"""
  list of params:
  inVal0:12,inVal1:22,inVal2:true,inVal3:5,inVal4:2.380000,inVal5:false""")

  Assert.equals(parentFunc(8.9,17.40),"result is  0.000000")
}
