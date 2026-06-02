/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a02_01

  @Level:         1

  @Assertion:    2.1.6.1(2) A single-line string literal consists of zero or more characters (except non-escaped 
                 character " and alone character \) enclosed by a pair of double quote character (i.e., ").
                 Furthermore, a single-line string literal can only be written on the same line.

  @Description:  Positive test with different variants of single-line string literals.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

public let myPublicTopLetSingleLine: String = "\0"
public var myPublicTopVarSingleLine: String = "!dsfghf\u{1102}wqeg"

let myTopLetSingleLine: String = "^5^-03-4k\\mv"
var myTopVarSingleLine: String = " 09u \u{1111}"

class myClass{
  static let myStaticLetSingleLine: String = "awfda"
  static var myStaticVarSingleLine: String = "abc\u{1112}"

  public let myPublicLetSingleLine: String = "\" sdgsdg \""
  public var myPublicVarSingleLine: String = ""
  protected let myProtectedLetSingleLine: String = ""
  protected var myProtectedVarSingleLine: String = ""
  private let myPrivateLetSingleLine: String = "dsgdrsh"
  private var myPrivateVarSingleLine: String = ""

  let myLetSingleLine: String = "\""
  var myVarSingleLine: String = ""

  myClass(inVal: String){
    this.myPublicVarSingleLine = inVal
    this.myProtectedVarSingleLine = inVal
    this.myPrivateVarSingleLine = inVal
    this.myVarSingleLine = inVal
  }
  func checkVal() {
    Assert.equals("\" sdgsdg \"", this.myPublicLetSingleLine)
    Assert.equals(this.myPublicVarSingleLine,myPublicTopVarSingleLine)
    Assert.equals("", this.myProtectedLetSingleLine)
    Assert.equals(this.myProtectedVarSingleLine,myPublicTopVarSingleLine)
    Assert.equals("dsgdrsh", this.myPrivateLetSingleLine)
    Assert.equals(this.myPrivateVarSingleLine,myPublicTopVarSingleLine)
    Assert.equals("\"", this.myLetSingleLine)
    Assert.equals(this.myVarSingleLine,myPublicTopVarSingleLine)
  }
}

main() {
  let myLocalLetSingleLine: String = ""
  var myLocalVarSingleLine: String = "<" + myLocalLetSingleLine

  Assert.equals("", myLocalLetSingleLine)
  Assert.equals("<", myLocalVarSingleLine)

  myLocalVarSingleLine = "\b wergd"
  Assert.equals("\b wergd", myLocalVarSingleLine)

  var myLocalVarSingleLineWithWriterSymbol: String = "\f  we"
  Assert.equals("\f  we", myLocalVarSingleLineWithWriterSymbol)
  var myLocalVarSingleLineWithNewLineSymbol: String = "asfwef \n"
  Assert.equals("asfwef \n", myLocalVarSingleLineWithNewLineSymbol)
  var myLocalVarSingleLineWithEnterSymbol: String = "asf \r wef"
  Assert.equals("asf \r wef", myLocalVarSingleLineWithEnterSymbol)
  let myLocalLetSingleLineWithHTabSymbol: String = "asf \t wef"
  Assert.equals("asf \t wef", myLocalLetSingleLineWithHTabSymbol)
  let myLocalLetSingleLineWithVTabSymbol: String = "ae43wqs \v Swe4tef"
  Assert.equals("ae43wqs \v Swe4tef", myLocalLetSingleLineWithVTabSymbol)
  var myLocalVarSingleLineWithSingleQuoteSymbol: String = "asf \' wef"
  Assert.equals("asf \' wef", myLocalVarSingleLineWithSingleQuoteSymbol)
  let myLocalVarSingleLineWithDoubleleQuoteSymbol: String = "double \" wef"
  Assert.equals("double \" wef", myLocalVarSingleLineWithDoubleleQuoteSymbol)


  Assert.equals("^5^-03-4k\\mv", myTopLetSingleLine)
  Assert.equals(" 09u \u{1111}", myTopVarSingleLine)
  
  Assert.equals("awfda", myClass.myStaticLetSingleLine)
  Assert.equals("abc\u{1112}", myClass.myStaticVarSingleLine)

  myLocalVarSingleLine = myClass.myStaticLetSingleLine
  Assert.equals(myLocalVarSingleLine,myClass.myStaticLetSingleLine)

  let myClassImpl = myClass(myPublicTopVarSingleLine)
  myClassImpl.checkVal()
}
