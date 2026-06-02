/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a07_01

  @Level:         1

  @Assertion:     5.1(7) The parameters of a function are enclosed by ().

  @Description:   Check different variants of function definition with parameters list.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFuncWoParameters(){
  "myFuncW/oParameters"
}
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

main() {
  Assert.equals(myFuncWoParameters(),"myFuncW/oParameters")
  Assert.equals(myFuncWithOneParameter(16),59)

  Assert.equals(myFuncWithThreeParameters(6,-97,true),6)
  Assert.equals(myFuncWithThreeParameters(6,-97,false),-97)
}
