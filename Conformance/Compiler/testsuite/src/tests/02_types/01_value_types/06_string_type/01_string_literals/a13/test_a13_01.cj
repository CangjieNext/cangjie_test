/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a13_01

  @Level:         1

  @Assertion:    2.1.6.1(13) String type support using == (!=) for equality (inequality) comparison. We say two strings are equal, if and only if their corresponding code point sequences are identical.

  @Description:  Compare different variants of string literals.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
func retEqualValue(inVal: String){
  inVal
}
func retChangedValue(inVal: String){
  inVal+"<>-03-csd"
}
main() {
  var mySingleLineVar1 = "!89#08\b7j\"hc slo\u{1111}"
  let mySingleLineLet1 = "!890\n87***jhcs\'lo\u{1113}(*3.,"
  var mySingleLineVar1Copy = mySingleLineVar1
  Assert.isTrue(mySingleLineVar1 == mySingleLineVar1Copy)
  Assert.isTrue(mySingleLineVar1 != mySingleLineLet1)
  Assert.isTrue(mySingleLineLet1 == retEqualValue(mySingleLineLet1))
  Assert.isTrue(mySingleLineVar1 != retChangedValue(mySingleLineVar1))

  var myMultyLineVar1 = """
  A!8908%7j+hc 
  a multy \\
  slo\u{1111}
  """
  let myMultyLineLet1 = """
  gg*8?<9387j
  ;soeg;po\vint
  ${mySingleLineVar1}
  h\0cslo\u{1113}
  """
  var myMultyLineVar1Copy = myMultyLineVar1
  Assert.isTrue(myMultyLineVar1 == myMultyLineVar1Copy)
  Assert.isTrue(myMultyLineVar1 != myMultyLineLet1)
  Assert.isTrue(myMultyLineLet1 == retEqualValue(myMultyLineLet1))
  Assert.isTrue(myMultyLineVar1 != retChangedValue(myMultyLineVar1))

  var myRawMultyLineVar1 = #"
  A!890\r8%7j+hc 
  a m\tulty
  slo\u{1111}"#
  let myRawMultyLineLet1 = #"\"#
  var myRawMultyLineVar1Copy = myRawMultyLineVar1
  Assert.isTrue(myRawMultyLineVar1 == myRawMultyLineVar1Copy)
  Assert.isTrue(myRawMultyLineVar1 != myRawMultyLineLet1)
  Assert.isTrue(myRawMultyLineLet1 == retEqualValue(myRawMultyLineLet1))
  Assert.isTrue(myRawMultyLineVar1 != retChangedValue(myRawMultyLineVar1))
}