/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a05_01

  @Level:         1

  @Assertion:    2.1.6.2(5) Line breaks are allowed in interpolation expressions inside multi-line strings.

  @Description:  Check that line breaks are allowed in interpolation expressions inside multi-line strings and resolved as expected.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

class myClass{
  private var varPrivate: String = "AWv%i"
  myClass(inVal: Int64){
    this.varPrivate = """
    m${
      inVal +
      1
      }a*swe"""
  }
  func checkValues(){
    Assert.equals(this.varPrivate,"""
    m29a*swe""")
  }
}

func myStringFunc(inVal0: Int64, inVal1: Int64, inVal: String) {
  """
  myFunc ${inVal}
  ${ inVal 
  
  inVal1 + inVal0
  }"""
}
main() {
  let myLet: String = """
  ${
    2 + 
    2
  }"""
  Assert.equals(myLet, """
  4""")
  var myStringFuncResult = myStringFunc(2,10,"Sum")
  Assert.equals(myStringFuncResult, """
  myFunc Sum
  12""")

  let myClassImpl = myClass(28)
  myClassImpl.checkValues()
}