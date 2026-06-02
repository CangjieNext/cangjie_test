/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_06_a01_01

  @Level:         1

  @Assertion:     5.1.6(1) Non-generic functions of the same name with the same parameter types in the same scope are 
                  considered to be redefined and a compilation error will be raised. 

  @Description:   Check that non-generic functions of the same name with the same parameter types in the different 
                  scopes are not considered to be redefined.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert
interface myInterface {
  func myFunc(a: Int32, b!: Int32): Int32 {a * b }
}

abstract class myAClass {
  public func myFunc(a: Int32, b!: Int32): Int32
}

class myClass {
  func myFunc(a: Int32, b!: Int32): Int32 { a - b }
}

struct myStruct {
  func myFunc(a: Int32, b!: Int32): Int32 { a + b}
}

enum myEnum { 
  A 

  func myFunc(a: Int32, b!: Int32): Int32 { a / b}
}

func myFunc(a: Int32, b!: Int32): Int32 { a + 10 } 

func myParentFunc(a: Int32) {
  var b: Int32 = 12
  func myFunc(a: Int32, b!: Int32): Int32 { a + 10 - b } 
  return myFunc(a, b: b)
}

main() {
  Assert.equals(12, myFunc(2, b: 6))
  Assert.equals(0, myParentFunc(2))

  var myClassImpl = myClass()
  Assert.equals(-2, myClassImpl.myFunc(2, b: 4))

  var myStructImpl = myStruct()
  Assert.equals(6, myStructImpl.myFunc(2, b: 4))

  Assert.equals(2, myEnum.A.myFunc(8, b: 4))
}
