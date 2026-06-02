/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a03_01

  @Level:         1

  @Assertion:     5.1.1.3(3) The modifiers of the struct member function include mut, public, private, and static. 
                  For details, see Struct Type.

  @Description:   Check that struct member function definition may use function modifiers: public, private mut and static.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

struct myStruct {
  public var myStructPublicVar: Int32 = 0
  private var myStructPrivateVar: Int32 = 0

  init(a: Int32, b: Int32) { 
    this.myStructPublicVar = a 
    this.myStructPrivateVar = b
  } 
  
  mut func myStructMutFunc(inVal: Int32) {
    myStructPrivateVar += inVal
  }
  
  private func getPrivateVar(): Int32 {
    this.myStructPrivateVar
  }

  public func checkValues(inVal1: Int32, inVal2: Int32) {
    Assert.equals(inVal1, this.myStructPublicVar)
    Assert.equals(inVal2, this.getPrivateVar())
  }

  static func myStaticFunc() {
    "this is a static func return value"
  }
}

extend myStruct { 
  mut func f(): Unit {
    this.myStructPublicVar += 1
  } 
} 

main() {
  Assert.equals("this is a static func return value", myStruct.myStaticFunc())

  var myStructImpl = myStruct(2, 5)
  myStructImpl.checkValues(2, 5)
  myStructImpl.myStructMutFunc(6)
  myStructImpl.checkValues(2, 11)
  myStructImpl.f()
  myStructImpl.checkValues(3, 11)
}
