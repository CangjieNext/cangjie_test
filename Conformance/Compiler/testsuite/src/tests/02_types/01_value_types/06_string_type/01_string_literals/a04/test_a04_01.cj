/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a04_01

  @Level:         1

  @Assertion:    2.1.6.1(4) A multi-line string literal consists of zero or more valid characters (except
                 alone character \ and non-escaped characters """) enclosed by a pair of three double
                 quote characters ("""), which begins after the line terminator of beginning double
                 quotations and ends before the first matched non-escaped ending double quotations.

  @Description:  Positive test with different variants of multy-line string literals.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

public let myPublicTopLetMultyLine: String = """
"""
public var myPublicTopVarMultyLine: String = """
!dsfghf\u{1102}wqeg"""

let myTopLetMultyLine: String = """
^5^-03-4kmv"""
var myTopVarMultyLine: String = """
 09u \u{1111}"""

class myClass{
  static let myStaticLetMultyLine: String = """
  awfda"""
  static var myStaticVarMultyLine: String = """
  abc\u{1112}"""

  public let myPublicLetMultyLine: String = """
  \""" sdgsdg \"""
  """
  public var myPublicVarMultyLine: String = """
  """
  protected let myProtectedLetMultyLine: String = """
  """
  protected var myProtectedVarMultyLine: String = """
  """
  private let myPrivateLetMultyLine: String = """
  dsgdrsh
  """
  private var myPrivateVarMultyLine: String = """
  
  """

  let myLetMultyLine: String = """
  \"""
  """
  var myVarMultyLine: String = """
  """

  myClass(inVal: String){
    this.myPublicVarMultyLine = inVal
    this.myProtectedVarMultyLine = inVal
    this.myPrivateVarMultyLine = inVal
    this.myVarMultyLine = inVal
  }
  func checkVal() {
    Assert.equals(this.myPublicLetMultyLine,"""
  \""" sdgsdg \"""
  """)
    Assert.equals(this.myPublicVarMultyLine,myPublicTopVarMultyLine)
    Assert.equals(this.myProtectedLetMultyLine,"""
  """)
    Assert.equals(this.myProtectedVarMultyLine,myPublicTopVarMultyLine)
    Assert.equals(this.myPrivateLetMultyLine,"""
  dsgdrsh
  """)
    Assert.equals(this.myPrivateVarMultyLine,myPublicTopVarMultyLine)
    Assert.equals(this.myLetMultyLine,"""
  \"""
  """)
    Assert.equals(this.myVarMultyLine,myPublicTopVarMultyLine)
  }
}

main() {
  let myLocalLetMultyLine: String = """
  """
  var myLocalVarMultyLine: String = """
  < ${myLocalLetMultyLine}"""

  Assert.equals(myLocalLetMultyLine,"""
  """)
  Assert.equals(myLocalVarMultyLine,"  <   ")
  
  Assert.equals(myTopLetMultyLine,"""
^5^-03-4kmv""")
  Assert.equals(myTopVarMultyLine,"""
 09u \u{1111}""")
  
  Assert.equals(myClass.myStaticLetMultyLine,"""
  awfda""")
  Assert.equals(myClass.myStaticVarMultyLine,"""
  abc\u{1112}""")

  myLocalVarMultyLine = myClass.myStaticLetMultyLine
  Assert.equals(myLocalVarMultyLine,myClass.myStaticLetMultyLine)

  let myClassImpl = myClass(myPublicTopVarMultyLine)
  myClassImpl.checkVal()

  var myLocalVarMultyLineWithWriterSymbol: String = """
  \f  we"""
  Assert.equals(myLocalVarMultyLineWithWriterSymbol,"""
  \f  we""")
  var myLocalVarMultyLineWithNewLineSymbol: String = """
  asfwef \n"""
  Assert.equals(myLocalVarMultyLineWithNewLineSymbol,"""
  asfwef \n""")
  var myLocalVarMultyLineWithEnterSymbol: String = """
  asf \r wef
  """
  Assert.equals(myLocalVarMultyLineWithEnterSymbol,"""
  asf \r wef
  """)
  let myLocalLetMultyLineWithHTabSymbol: String = """
  asf \t wef"""
  Assert.equals(myLocalLetMultyLineWithHTabSymbol,"""
  asf \t wef""")
  let myLocalLetMultyLineWithVTabSymbol: String = """
  e43wqs 
  \v Swe4tef"""
  Assert.equals(myLocalLetMultyLineWithVTabSymbol,"""
  e43wqs 
  \v Swe4tef""")
  var myLocalVarMultyLineWithSingleQuoteSymbol: String = """
  as
  f \' 
  wef"""
  Assert.equals(myLocalVarMultyLineWithSingleQuoteSymbol,"""
  as
  f \' 
  wef""")
  let myLocalVarMultyLineWithDoubleleQuoteSymbol: String = """
  double \" wef
  
  """
  Assert.equals(myLocalVarMultyLineWithDoubleleQuoteSymbol,"""
  double \" wef
  
  """)
}