/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a08_01

  @Level:         1

  @Assertion:    2.1.6.2(8) If the $ is escaped by \, the content after $ is not treated as interpolation expression, whether or not followed by {.

  @Description:  Check that: 
                  1. interpolated expression with right syntax but escaped by \ is not treated.
                  2. string like interpolated expression (without } escaped by \ doesn' produce an error.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

func myFunc(inVal: Float32){
  "\${inVal} ${inVal}"
}
main() {
  let objName = "tests"
  let count = 10
  var mySingleLineWithEscapedExpression = "There are \${ count } ${objName}."
  Assert.equals("There are \${ count } tests.", mySingleLineWithEscapedExpression)
  mySingleLineWithEscapedExpression = "There are \${ count is ${count} } ${objName}."
  Assert.equals("There are \${ count is 10 } tests.", mySingleLineWithEscapedExpression)

  let myMultyLineWithEscapedExpression = """
  There are ${ count * 2} \${objName}."""
  Assert.equals("""
  There are 20 \${objName}.""", myMultyLineWithEscapedExpression)

  let mySingleLineLikeExpression = "There are \${ count ${objName}."
  Assert.equals("There are \${ count tests.", mySingleLineLikeExpression)

  let myMultyLineLikeExpression = """
There are \${ count \${objName}."""
  Assert.equals("There are \${ count \${objName}.", myMultyLineLikeExpression)

  var funcRet = myFunc(12.36)
  Assert.equals("\${inVal} 12.360000", funcRet)
}