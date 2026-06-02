/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a08_01

  @Level:         1

  @Assertion:     5.1.2.2(8) The name introduced in the default value of a function parameter is obtained from the 
                  static scope, that is, the names introduced by default value is the names that can be accessed when 
                  the function is defined. 

  @Description:   Check that accessible variable can be used as default value by name.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

var myVar: Int32 = 12

func add(a: Int32, b!: Int32 = myVar): Int32 { a + b } 
func myParentFunc(a: Bool) {
  var myLocalVar1: Int32 = 12
  var myLocalVar2: Int32 = 6
  func myChildFunc(g!: Int32 = myLocalVar1 ) {
    g
  }
  if (a) {
    return myChildFunc()
  }else{
    return myChildFunc(g: myLocalVar2)
  }
}
class myClass {
  static var myStaticClassMemberVar: String = "default value"
  static let myStaticClassMemberLet: Int32 = 8
  var myClassVar: Int32 = 6

  static func add(a: Int32, b!: Int32 = myStaticClassMemberLet ) {
    a+b
  }

  func print(s!: String = myStaticClassMemberVar): String { s }

  func myFunc(d!: Int32 = myClassVar): String { "${d}" }
}
 
main() {
  Assert.equals(12, myParentFunc(true))
  Assert.equals(6, myParentFunc(false))

  Assert.equals(15, add(3))
  Assert.equals(5, add(3, b: 2))

  Assert.equals(8, myClass.add(0))
  Assert.equals(13, myClass.add(6, b: 7))

  var myClassImpl = myClass()
  Assert.equals("default value", myClassImpl.print())
  Assert.equals("2", myClassImpl.print(s: "2"))

  Assert.equals("6", myClassImpl.myFunc())
  Assert.equals("12", myClassImpl.myFunc(d: 12))

  func myLocalFunc(s!: String = "FFF"){
    s
  }
  Assert.equals("FFF", myLocalFunc())
  Assert.equals("AAA", myLocalFunc(s: "AAA"))
}
