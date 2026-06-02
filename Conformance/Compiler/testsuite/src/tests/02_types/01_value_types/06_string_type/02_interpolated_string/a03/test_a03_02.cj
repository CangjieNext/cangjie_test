/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a03_02

  @Level:         1

  @Assertion:    2.1.6.2(3) Each interpolation expression in the string literal is wrapped in a pair of {}, and prefixed by $.

  @Description:  Check different variants of not interpolated strings: 
                  with escaped "$"
                  inside multy-line raw string

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      Need more variants

*/
import utils.assert.Assert

public let myPublicTopLet0: String = ##"asdg${ 2 + 2 }adsg"##
public var myPublicTopVar: String = """
    aqwf4sdg
    \${ 'F' }a
    dsg
"""
let myTopLet: String = "SDRH==R\${6*5}"

var myTopVar: String = """
\" \${0x1.1p0} """

main() {
  
  Assert.isTrue(myPublicTopLet0 != "asdg4adsg")
  Assert.isTrue(myPublicTopLet0 == ##"asdg${ 2 + 2 }adsg"##)
  Assert.notEquals(myPublicTopLet0,"asdg4adsg")
  
  Assert.equals(myPublicTopLet0, ##"asdg${ 2 + 2 }adsg"##)
  Assert.notEquals(myPublicTopVar, """
    aqwf4sdg
    Fa
    dsg
""")
  Assert.equals(myPublicTopVar, """
    aqwf4sdg
    \${ 'F' }a
    dsg
""")
  Assert.isTrue(myPublicTopVar != """
    aqwf4sdg
    Fa
    dsg
""")
  Assert.isTrue(myPublicTopVar == """
    aqwf4sdg
    \${ 'F' }a
    dsg
""")

  Assert.isTrue(myTopLet != "SDRH==R30")
  Assert.isTrue(myTopLet == "SDRH==R\${6*5}")
  Assert.notEquals(myTopLet,"SDRH==R30")
  Assert.equals(myTopLet, "SDRH==R\${6*5}")

  Assert.isTrue(myTopVar == """
\" \${0x1.1p0} """)
  Assert.isTrue(myTopVar != """
\" 1.0625 """)
  Assert.equals(myTopVar,"""
\" \${0x1.1p0} """)
  Assert.notEquals(myTopVar, """
\" 1.0625 """)

  let myArr: Array<Rune> = [r'r',r'T', r'\u{00A7}']
  var myFromArrayVar = ""
  for(charItem in myArr) {
    myFromArrayVar = myFromArrayVar + "\${charItem}"
  }
  Assert.notEquals(myFromArrayVar, "r T §")
  Assert.equals(myFromArrayVar,"\${charItem}\${charItem}\${charItem}")
  Assert.isTrue(myFromArrayVar != "r T §")
  Assert.isTrue(myFromArrayVar == "\${charItem}\${charItem}\${charItem}")
}