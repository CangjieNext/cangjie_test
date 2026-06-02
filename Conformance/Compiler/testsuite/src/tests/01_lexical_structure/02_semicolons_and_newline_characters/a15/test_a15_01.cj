/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a15_01

  @Level:         1

  @Assertion:    1.2(15) For multi-line string literal, the string literal is terminated
                         by the first non-escaped three double quotations (""");

  @Description:  Check the diffrent cases when the multi-line string literal is terminated
                 by the first non-escape three double quotation (""").

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert;

main() {
var s  : String = ""
var o  : Int64  = 0
let o1 : Float64 = 1.0

// test case #1
    s = """
${o}${o1}\""" """
    Assert.equals("01.000000\"\"\" ", s)

// test case #2
    s = """
${o} ; let o : String = \"foo\" \""" """
    Assert.equals("0 ; let o : String = \"foo\" \"\"\" ", s)

// test case #3
    s = """
$o ; let obj : String = \"foo\" \""" """
    Assert.equals("$o ; let obj : String = \"foo\" \"\"\" ", s)

// test case #4
    s = """
~[\"\\\r\n] \""" """
    Assert.equals("~[\"\\\r\n] \"\"\" ", s)

// test case #5
    s = """
\\t \""" """
    Assert.equals("\\t \"\"\" ", s)

// test case #6
    s = """
~ \\$ \""" """
    Assert.equals("~ \\$ \"\"\" ", s)

// test case #7
    s = """
${o} ~[\"\\\r\n] \""" """
    Assert.equals("0 ~[\"\\\r\n] \"\"\" ", s)

// test case #8
    s = """
${o} ~[\"\\\r\n] ${o1} \""" """
    Assert.equals("0 ~[\"\\\r\n] 1.000000 \"\"\" ", s)

// test case #9
    s = """
${o} \\u{0xff} \"\"\""""
    Assert.equals("0 \\u{0xff} \"\"\"", s)

// test case #10
    s = """
${o} \u{4f60}\u{101}\u{ffff}abc \""" """
    Assert.equals("0 \u{4f60}\u{101}\u{ffff}abc \"\"\" ", s)
}
