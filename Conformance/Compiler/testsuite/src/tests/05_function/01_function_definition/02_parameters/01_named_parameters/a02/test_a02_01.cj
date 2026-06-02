/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a02_01

  @Level:         1

  @Assertion:     5.1.2.1(2) When the function is declared, non-named parameters must precede all named parameters.

  @Description:   Different variants of right syntax for named parameters.

  @Mode:          run

  @Negative:      no

  @Structure:     single

  @Issue:         6180

  @Comment:        To avoid misunderstanding, you need to add " (if exists)" after "non-named parameters "

*/
import utils.assert.Assert

interface myInterface {
  func myInterfaceFuncWithNonNamedAndNamed(a: String,b!: String, c!: String): String
  func myInterfaceFuncWithNamedOnly(b!: String, c!: String): String
}

func myFuncWithNonNamedAndNamed(a: Int32, b!: UInt16) {
  "${a} ${b}"
}

func myFuncWithNamedOnly(x!: String, y!: Bool) {
  "${x} ${y}"
}

class myClass {
  func myClassWithNonNamedAndNamed(a: Int32, b!: Int32) {
    a + b
  }

  func myClassWithNamedOnly(a!: UInt32, b!: String) {
    "${b} ${a}"
  }

}

struct myStruct <: myInterface {
  public func myInterfaceFuncWithNonNamedAndNamed(a: String, b!: String, c!: String): String {
    "${a} ${b} ${c}"
  }
  public func myInterfaceFuncWithNamedOnly(b!: String, c!: String): String {
    "${b} ${c}"
  }

}

enum myEnum {
  A

  func myEnumWithNonNamedAndNamed(g: Int64, h!: Int64) {
    g * 2 + h
  }

  func myEnumWithNamedOnly(a!: Int32, b!: Int32) {
    b-a
  }
}

main() {
  Assert.equals("32 6",myFuncWithNonNamedAndNamed(32, b: 6))
  Assert.equals("7 true",myFuncWithNamedOnly(x: "7", y: true))
  Assert.equals("7 true",myFuncWithNamedOnly(y: true, x: "7"))

  var myClassImpl = myClass()
  Assert.equals(38,myClassImpl.myClassWithNonNamedAndNamed(32, b: 6))
  Assert.equals("6 32",myClassImpl.myClassWithNamedOnly(a:32, b: "6"))
  Assert.equals("6 32",myClassImpl.myClassWithNamedOnly(b: "6", a:32))

  let myStructImpl = myStruct()
  Assert.equals("aaa HHH rrr",myStructImpl.myInterfaceFuncWithNonNamedAndNamed("aaa", b: "HHH", c: "rrr"))
  Assert.equals("aaa HHH rrr",myStructImpl.myInterfaceFuncWithNonNamedAndNamed("aaa", c: "rrr", b: "HHH"))
  Assert.equals("A#A 235",myStructImpl.myInterfaceFuncWithNamedOnly(c: "235", b: "A#A"))
  Assert.equals("A#A 235",myStructImpl.myInterfaceFuncWithNamedOnly(b: "A#A", c: "235"))

  Assert.equals(64,myEnum.A.myEnumWithNonNamedAndNamed(24, h: 16))
  Assert.equals(33,myEnum.A.myEnumWithNamedOnly(a: 22, b: 55))
  Assert.equals(33,myEnum.A.myEnumWithNamedOnly(b: 55, a: 22))
}
