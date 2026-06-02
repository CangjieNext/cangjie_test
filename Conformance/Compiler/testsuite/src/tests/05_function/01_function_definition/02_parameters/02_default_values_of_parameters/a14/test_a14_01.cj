/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a14_01

  @Level:         1

  @Assertion:     5.1.2.2(14) When a function is called, can use the default value.
  
  @Description:   Check that function can be called with default values.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func add(a!: Int32 = 3, b!: Int32 = a): Int32 { a + b } 

class myClass {

  static func myClassStaticFunc(b!: Int32 = 5, c!: Int32 = b) {
    b + c
  }

  func myClassFunc(a: Int32, b: Int32, c!: Int32 = b) {
    a + b - c
  }
}

struct myStruct {

  static func myStructStaticFunc(b!: Int32 = 6, c!: Int32 = b) {
    b * c
  }

  func myStructFunc(a: Int32, b: Int32, c!: Int32 = b) {
    a * b - c
  }
}

enum myEnum {

  E

  func myEnumFunc(a: Int32, b: Int32, c!: Int32 = b) {
    (a + b ) * c
  }

}

main() {
  Assert.equals(6, add())
  Assert.equals(8, add(a:4))
  Assert.equals(7, add(b:4))
  Assert.equals(9, add(a:7, b: 2))

  Assert.equals(12, myClass.myClassStaticFunc(b: 6))
  Assert.equals(9, myClass.myClassStaticFunc(b:6, c: 3))
  Assert.equals(8, myClass.myClassStaticFunc(c: 3))
  Assert.equals(10, myClass.myClassStaticFunc())

  var myClassImpl = myClass()
  Assert.equals(6, myClassImpl.myClassFunc(6, 7))
  Assert.equals(9, myClassImpl.myClassFunc(6, 7, c: 4))

  Assert.equals(36, myStruct.myStructStaticFunc())
  Assert.equals(16, myStruct.myStructStaticFunc(b:4))
  Assert.equals(15, myStruct.myStructStaticFunc(b:5, c: 3))
  Assert.equals(18, myStruct.myStructStaticFunc(c: 3))

  var myStructImpl = myStruct()
  Assert.equals(35, myStructImpl.myStructFunc(6, 7))
  Assert.equals(38, myStructImpl.myStructFunc(6, 7, c: 4))

  Assert.equals(91, myEnum.E.myEnumFunc(6, 7))
  Assert.equals(52, myEnum.E.myEnumFunc(6, 7, c: 4))
}
