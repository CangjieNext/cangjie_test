/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a07_01

  @Level:         1

  @Assertion:    2.1.6.2(7) If the $ in the string is not followed by { , it should be treated as normal $ character.

  @Description:  Check different combination of "$" usage with and without pair of {}.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main() {
  let mySimpleExpression = "$${"AS"}"
  Assert.equals("$AS", mySimpleExpression)
  var myAnotherSimpleExpression = "${mySimpleExpression}$"
  Assert.equals("$AS$", myAnotherSimpleExpression)
  myAnotherSimpleExpression = "${myAnotherSimpleExpression}$"
  Assert.equals("$AS$$", myAnotherSimpleExpression)
  let notInterpolated = """
  This is not an expression:
   $"""
  Assert.equals(notInterpolated, """
  This is not an expression:
   $""")

  let notAInterpolated0 = """
  $ also not an expression"""
  Assert.equals(notAInterpolated0, """
  $ also not an expression""")

  var simpleNot = "$AS"
  var interpolatedByNotInterpolated = "Intrepolated from notinterpolated ${simpleNot}"
  Assert.equals(interpolatedByNotInterpolated, "Intrepolated from notinterpolated $AS")

  let myMultyLineExpression = """
  ${
    12/4
    }$"""
  Assert.equals(myMultyLineExpression, """
  3$""")

}