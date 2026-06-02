/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_01_a01_01

  @Level:         1

  @Assertion:     5.3.1(1) Named arguments are arguments with argument-name : prefix.

  @Description:   Check that named arguments can be used for invacation of function with named parameters.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

class myClass {
  func myClassFunc0(a!: String): String { a }

  func myClassFunc1(a!: Int32, b!: Bool): Int32 { 
    if(b) {
      return a
    }
    return a + 1
  }

  func myClassFunc2(a: Int32, b!: Int32): Bool { 
    a < b
  }
}

struct myStruct {
  func myStructFunc0(a!: Int64): Int64 { a + 1 }

  func myStructFunc1(a!: Rune, b!: Int32): Rune { 
    if(b > 0) {
      return a
    }
    return r'D'
  }
}

enum myEnum {
  D

  func myEnumFunc(i!: Bool): String { "${i}" }
}

func myFunc0(s!: String) {
  " AAA ${s} BBB"
}

func myFunc1(s!: String, b!: Rune) {
  "${b} AAA ${s} "
}

main() {
  Assert.equals(" AAA 346 BBB", myFunc0(s: "346"))
  Assert.equals("C AAA %4*** ", myFunc1(s: "%4***", b: r'C'))
  Assert.equals("C AAA %4*** ", myFunc1(b: r'C', s: "%4***"))

  var myClassImpl = myClass()
  Assert.equals("(&^(H", myClassImpl.myClassFunc0(a: "(&^(H"))
  Assert.equals(5, myClassImpl.myClassFunc1(a: 5, b: true))
  Assert.equals(6, myClassImpl.myClassFunc1(b: false, a: 5 ))
  Assert.equals(true, myClassImpl.myClassFunc2(5, b: 6))

  var myStructImpl = myStruct()
  Assert.equals(23, myStructImpl.myStructFunc0(a: 22))
  Assert.equals(r'c', myStructImpl.myStructFunc1(a: r'c', b: 6))
  Assert.equals(r'D', myStructImpl.myStructFunc1(a: r'c', b: -6))

  Assert.equals("true", myEnum.D.myEnumFunc(i: true))
  Assert.equals("false", myEnum.D.myEnumFunc(i: false))
}
