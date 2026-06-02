/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a06_01

  @Level:         1

  @Assertion:     5.1.2(6)  It is worth noting that parameter types are not affected by whether they are named 
                  parameters or have default values (see the following sections) and when it comes to parameter 
                  types, a type and its aliases are regarded the same (parameter type). 

  @Description:   Check that different type of function parameters have defined types.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myInt64 = Int64
type myInt32 = Int32
type myString = String
type myBool = Bool
type myChar = Rune
type myFloat32 = Float32

interface myInterface {
  func myInterfaceFunc(a: String, b!: myString, c!: String): String
}

func myFuncWithNonNamedParameters(a: Int32, b: myInt32, c: Rune, d!:myChar) {
  Assert.isTrue(c is Rune)
  Assert.isTrue(d is myChar)
  Assert.isTrue(d is Rune)
  Assert.isTrue(c is myChar)
  "${a} ${b} ${c}"
}

func myFuncWithNamedParameters(x!: String, y!: Bool, h!: myBool) {
  Assert.isTrue(y is Bool)
  Assert.isTrue(h is myBool)
  Assert.isTrue(h is Bool)
  Assert.isTrue(y is myBool)
  "${x} ${y}"
}

func myFuncWithAnyParameters(l: Int64 , m!: myInt32 = 1, n!: Rune) {
  Assert.isTrue(l is Int64)
  Assert.isTrue(l is myInt64)
  Assert.isTrue(m is Int32)
  Assert.isTrue(m is myInt32)
  Assert.isTrue(n is Rune)
  Assert.isTrue(n is myChar)
  "${l} ${m} ${n}"
}

class myClass {
  func myClassF4(k: myInt64, l!: Int64 = 8, m!: myInt64) {
    Assert.isTrue(k is Int64)
    Assert.isTrue(k is myInt64)
    Assert.isTrue(l is Int64)
    Assert.isTrue(l is myInt64)
    Assert.isTrue(m is Int64)
    Assert.isTrue(m is myInt64)
    k + l + m
  }

}

struct myStruct <: myInterface {
  public func myInterfaceFunc(a: String, b!: myString = "A#A", c!: String): String {
    Assert.isTrue(a is String)
    Assert.isTrue(c is String)
    Assert.isTrue(c is myString)
    Assert.isTrue(b is myString)
    Assert.isTrue(b is String)
    Assert.isTrue(a is myString)
    "${a} ${b} ${c}"
  }
  func myStructF1(h: Float32, i:myFloat32) {
    Assert.isTrue(h is Float32)
    Assert.isTrue(i is myFloat32)
    Assert.isTrue(h is myFloat32)
    Assert.isTrue(i is Float32)
    h
  }

  func myStructF2(c!: String, d!: myString) {
    Assert.isTrue(c is String)
    Assert.isTrue(c is myString)
    Assert.isTrue(d is myString)
    Assert.isTrue(d is String)
    "${c} ${d}"
  }

  func myStructF3(a!: String = "AnUt", b!: String = "wegfsgs") {
    Assert.isTrue(a is String)
    Assert.isTrue(a is myString)
    Assert.isTrue(b is myString)
    Assert.isTrue(b is String)
    "${b} ${a}"
  }

}

enum myEnum {
  A

  func myEnumF1(g: Int64, e: myInt64) {
    Assert.isTrue(g is Int64)
    Assert.isTrue(g is myInt64)
    Assert.isTrue(e is myInt64)
    Assert.isTrue(e is Int64)
    g * 2 + e
  }

  func myEnumF4(a: myInt32, b!: Int32, d!: myInt32 = 2) {
    Assert.isTrue(a is Int32)
    Assert.isTrue(a is myInt32)
    Assert.isTrue(b is myInt32)
    Assert.isTrue(b is Int32)
    Assert.isTrue(d is myInt32)
    Assert.isTrue(d is Int32)
    a + b + d
  }
}

main() {
  Assert.equals("1 15 C", myFuncWithNonNamedParameters(1, 15, r'C', d: r'h'))

  Assert.equals("FgE23532 true", myFuncWithNamedParameters(y: true, x: "FgE23532", h: false))
  Assert.equals("23fsdfse@@E2* false", myFuncWithNamedParameters(h: false, x: "23fsdfse@@E2*", y: false))

  Assert.equals("22 16 v", myFuncWithAnyParameters(22, m: 16, n: r'v'))
  Assert.equals("-6 1 u", myFuncWithAnyParameters(-6, n: r'u'))

  var myClassImpl = myClass()
  Assert.equals(18, myClassImpl.myClassF4(6, l: 4, m: 8))
  Assert.equals(20, myClassImpl.myClassF4(2, m: 10))

  var myStructImpl = myStruct()
  Assert.equals("A UUU ZZZ", myStructImpl.myInterfaceFunc("A", b: "UUU", c: "ZZZ"))
  Assert.equals("A A#A ZZZ", myStructImpl.myInterfaceFunc("A", c: "ZZZ"))
  var inH: Float32 = 16.23
  var inB: myFloat32 = -6.03
  Assert.equals(inH, myStructImpl.myStructF1(16.23, inB))
  Assert.equals("wq3tw4 @#$RRR", myStructImpl.myStructF2(c: "wq3tw4", d: "@#$RRR"))
  Assert.equals("wq3tw4 @#$RRR", myStructImpl.myStructF2(d: "@#$RRR", c: "wq3tw4"))

  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(a: "wq3tw4", b: "@#$RRR"))
  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(b: "@#$RRR", a: "wq3tw4"))
  Assert.equals("@#$RRR AnUt", myStructImpl.myStructF3(b: "@#$RRR"))
  Assert.equals("wegfsgs wq3tw4", myStructImpl.myStructF3(a: "wq3tw4"))
  Assert.equals("wegfsgs AnUt", myStructImpl.myStructF3())

  Assert.equals(96, myEnum.A.myEnumF1(4, 88))
  Assert.equals(14, myEnum.A.myEnumF4(3, b: 5, d: 6))
  Assert.equals(8, myEnum.A.myEnumF4(-1, b: 7))

}
