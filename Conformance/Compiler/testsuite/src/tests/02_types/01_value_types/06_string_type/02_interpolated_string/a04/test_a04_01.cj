/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a04_01

  @Level:         1

  @Assertion:    2.1.6.2(4) A sequence of expressions and decalrations are allowed within the enclosing pair of curly brakets same as blocks, however, empty sequence is forbidden.

  @Description:  Check different variants of interpolated strings with expressions and declarations
                  calculated expressions
                  comparison expressions
                  function call
                  cycles
                  quoted interpolation expression inside another interpolation expression

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      Need more variants

*/
import utils.assert.Assert

public let myPublicTopLet: String = "asdg${ 2 + 2^2 }adsg"
public var myPublicTopVar: String = "SDRH==R${ 6 <=5 }"

let myTopLet: String = """
${ 
  var myArr: Array<Int64> = [1, 2, 5, 7]
  var myTotal = 0
  for(item in myArr){
    myTotal = myTotal + item
  }
  "${myTotal}"
}"""

func myFunc(inVal: String) {
  "myFunc retVal is ${inVal}"
}
main() {
  let myLocalLet = "${ "AAA" + "${ (3 + 2) * 4}" + "!" }"
  Assert.equals("AAA20!", myLocalLet)

  var myLocalVar = """
  ${myFunc("AAA")}"""

  Assert.isTrue(myLocalVar == """
  myFunc retVal is AAA""")

  Assert.isTrue(myPublicTopLet == "asdg6adsg")
  Assert.isTrue(myPublicTopVar == "SDRH==Rfalse")
  Assert.isTrue(myTopLet == "15")
}