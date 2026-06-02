/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_a01_01

  @Level:         1

  @Assertion:    2.1.6(1) The string type is written as String, and useful for holding textual data. A string consists a series of Unicode characters.

  @Description:  Check that variable declared as String can hold textual data.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

public let myPublicTopLet: String = "asdgadsg"
public var myPublicTopVar: String = "SDRH==R65"

let myTopLet: String = "P,K#L"
var myTopVar: String = "\"HWasfSETang\""

class myClass{
  static public let letStaticPublic: String = "dsl;fk"
  static public var varStaticPublic: String = "we$tdcxsd"
  public let letPublic: String = "908wefkl"
  public var varPublic: String = "34dsdfvd@f"
  protected let letProtected: String = "df&gn"
  protected var varProtected: String = "hv jk"
  private let letPrivate: String = "AWv%i"
  private var varPrivate: String = "m98a*swe"
  let letVar: String = "zscew34!"
  var varVar: String = "879szd>e"
  myClass(inVal: Int64){
    this.varPrivate = "m${inVal}a*swe"
  }
  func checkValues(){
    Assert.equals("908wefkl", this.letPublic)
    Assert.isTrue(this.letPublic is String)
    Assert.equals("34dsdfvd@f", this.varPublic)
    Assert.isTrue(this.varPublic is String)
    Assert.equals("df&gn", this.letProtected)
    Assert.isTrue(this.letProtected is String)
    Assert.equals("hv jk", this.varProtected)
    Assert.isTrue(this.varProtected is String)
    Assert.equals("AWv%i", this.letPrivate)
    Assert.isTrue(this.letPrivate is String)
    Assert.equals("m98a*swe", this.varPrivate)
    Assert.isTrue(this.varPrivate is String)
    Assert.equals("zscew34!", this.letVar)
    Assert.isTrue(this.letVar is String)
    Assert.equals("879szd>e", this.varVar)
    Assert.isTrue(this.varVar is String)
  }
}
struct myStruct {
  static var myStaticVarString: String = ""
  static let myStaticLetString: String = "se...g"
  public static var myPublicStaticVarString: String = "mys,,,tring"
  private static var myPrivateStaticVarString: String = "H"
  public static let myPublicStaticLetString: String = "q238"
  private static let myPrivateStaticLetString: String = "2+6"
  public var myPublicVarString: String = "mys(tring"
  private var myPrivateVarString: String = "23)fdsv"
  public let myPublicLetString: String = "w34t34"
  private let myPrivateLetString: String = "ddd-dd2 y"
  var myVarString: String = "vds  asfwae"
  let myLetString: String = "gyuilfcvgb"
  func checkValues(){
    Assert.equals("23)fdsv", this.myPrivateVarString)
    Assert.isTrue(this.myPrivateVarString is String)
    Assert.equals("ddd-dd2 y", this.myPrivateLetString)
    Assert.isTrue(this.myPrivateLetString is String)
  }
}
func myStringFunc() {
  "myFunc retVal"
}
main() {
  let myLet: String = "12ddsv5 v"
  Assert.equals("12ddsv5 v", myLet)
  Assert.isTrue(myLet is String)
  var myVar: String = ""
  Assert.equals("", myVar)
  Assert.isTrue(myVar is String)

  myVar = myStringFunc()
  Assert.equals("myFunc retVal", myVar)
  Assert.isTrue(myVar is String)

  let myUnicode = "\u{4f60}\u{101}\u{ffff}abc"
  Assert.equals("\u{4f60}\u{101}\u{ffff}abc", myUnicode)

  var myConcatedVar = "${myUnicode} \u{1112} ${myVar}"
  Assert.equals("\u{4f60}\u{101}\u{ffff}abc \u{1112} myFunc retVal", myConcatedVar)

  let myArr: Array<Rune> = [r'r',r'T', r'\u{1113}']
  var myConcatedFromArrayVar = ""
  myConcatedFromArrayVar += String(myArr)
  Assert.equals("rT\u{1113}", myConcatedFromArrayVar)

  Assert.equals("asdgadsg", myPublicTopLet)
  Assert.isTrue(myPublicTopLet is String)
  Assert.equals("SDRH==R65", myPublicTopVar)
  Assert.isTrue(myPublicTopVar is String)
  Assert.equals(myTopLet, "P,K#L")
  Assert.isTrue(myTopLet is String)
  Assert.equals("\"HWasfSETang\"", myTopVar)
  Assert.isTrue(myTopVar is String)

  Assert.equals("dsl;fk", myClass.letStaticPublic)
  Assert.isTrue(myClass.letStaticPublic is String)
  Assert.equals("we$tdcxsd", myClass.varStaticPublic)
  Assert.isTrue(myClass.varStaticPublic is String)
  var myClassImpl = myClass(98)
  myClassImpl.checkValues()

  Assert.equals("", myStruct.myStaticVarString)
  Assert.isTrue(myStruct.myStaticVarString is String)
  Assert.equals("se...g", myStruct.myStaticLetString)
  Assert.isTrue(myStruct.myStaticLetString is String)
  Assert.equals(myStruct.myPublicStaticVarString, "mys,,,tring")
  Assert.isTrue(myStruct.myPublicStaticVarString is String)
  Assert.equals("q238", myStruct.myPublicStaticLetString)
  Assert.isTrue(myStruct.myPublicStaticLetString is String)
  var myStructImpl = myStruct()
  myStructImpl.checkValues()
}