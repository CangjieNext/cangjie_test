/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a01_01

  @Level:         1

  @Assertion:     5.1.2.2(1) Function parameters may have default values. Default values are declared with = as shown 
                  in the example below.


  @Description:   Different variant of parameters with default values usage.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
  func myInterfaceFunc(b!: String ): String {"AAA"}
}

func myFuncWithDefaultValue(k!: String = "paramValue") {
  "${k}"
}

func myFuncWithAnyParameters(l: Int64 , m!: Int32 = 1, n!: Rune) {
  "${l} ${m} ${n}"
}

func myFuncWithManyDefaultValues(l: Int64 , m!: Int32 = 1, n!: Rune = r'D') {
  "${l} ${m} ${n}"
}

class myClass {
  func myClassF3(f!: Bool = true) {
    return f
  }

  func myClassF4(k: Int64, l!: Int64 = 8, m!: Int64) {
    k + l + m
  }

  func myClassF5(k: Int64, l!: Int64 = 8, m!: Int64 = 5) {
    k + l + m
  }

}

struct myStruct <: myInterface {
  public func myInterfaceFunc(b!: String = "A#A"): String {
    "${b}"
  }
  func myStructF3(a!: String = "AnUt", b!: String = "wegfsgs") {
    "${b} ${a}"
  }

  func myStructF4(a: String, b!: Int32 = 10, c!: UInt16) {
    "${a} ${c} ${b}"
  }

  func myStructF5(a: String, b!: Int32 = 10, c!: Bool = true) {
    "${a} ${c} ${b}"
  }

}

enum myEnum {
  A

  func myEnumF3(c!: Rune = r'C', d!: Rune) {
    " ${c} ${d}"
  }

  func myEnumF4(a: Int32, b!: Int32, d!: Int32 = 2) {
    a + b + d
  }

  func myEnumF5(a!: Int32 = 4, b!: Int32 = 9, d!: Int32 = 2) {
    a + b + d
  }
}

main() {
  Assert.equals("%owefFgE23532", myFuncWithDefaultValue(k: "%owefFgE23532"))
  Assert.equals("paramValue", myFuncWithDefaultValue())

  Assert.equals("22 16 v", myFuncWithAnyParameters(22, m: 16, n: r'v'))
  Assert.equals("-6 1 u", myFuncWithAnyParameters(-6, n: r'u'))

  Assert.equals("22 1 D", myFuncWithManyDefaultValues(22))
  Assert.equals("0 3 D", myFuncWithManyDefaultValues(0, m: 3))
  Assert.equals("7 1 s", myFuncWithManyDefaultValues(7, n: r's'))
  Assert.equals("7 5 u", myFuncWithManyDefaultValues(7, m: 5, n: r'u'))
  Assert.equals("7 5 u", myFuncWithManyDefaultValues(7, n: r'u', m: 5))
  
  var myClassImpl = myClass()
  Assert.equals(false, myClassImpl.myClassF3(f:false))
  Assert.equals(true, myClassImpl.myClassF3())
  Assert.equals(18, myClassImpl.myClassF4(6, l: 4, m: 8))
  Assert.equals(20, myClassImpl.myClassF4(2, m: 10))
  Assert.equals(4, myClassImpl.myClassF5(-9))
  Assert.equals(20, myClassImpl.myClassF5(8, l: 4, m: 8))
  Assert.equals(20, myClassImpl.myClassF5(8, m: 8, l: 4))
  Assert.equals(8, myClassImpl.myClassF5(-1, l: 4))
  Assert.equals(22, myClassImpl.myClassF5(4, m: 10))
  
  var myStructImpl = myStruct()
  Assert.equals("UUU", myStructImpl.myInterfaceFunc(b: "UUU"))
  Assert.equals("A#A", myStructImpl.myInterfaceFunc())

  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(a: "wq3tw4", b: "@#$RRR"))
  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(b: "@#$RRR", a: "wq3tw4"))
  Assert.equals("@#$RRR AnUt", myStructImpl.myStructF3(b: "@#$RRR"))
  Assert.equals("wegfsgs wq3tw4", myStructImpl.myStructF3(a: "wq3tw4"))
  Assert.equals("wegfsgs AnUt", myStructImpl.myStructF3())
  Assert.equals("SSS 7 -5", myStructImpl.myStructF4("SSS", b: -5, c: 7))
  Assert.equals("SSS 12 6", myStructImpl.myStructF4("SSS", c: 12, b: 6))
  Assert.equals("SSS 4 10", myStructImpl.myStructF4("SSS", c: 4))
  Assert.equals("q33 true 10", myStructImpl.myStructF5("q33"))
  Assert.equals("q*73 true 8", myStructImpl.myStructF5("q*73", b: 8))
  Assert.equals("q*Y5%73 false 10", myStructImpl.myStructF5("q*Y5%73", c: false))
  Assert.equals("3$+*&73 false -9", myStructImpl.myStructF5("3$+*&73", b: -9, c: false))
  Assert.equals("3$+*&73 false -9", myStructImpl.myStructF5("3$+*&73", c: false, b: -9))

  Assert.equals(" C D", myEnum.A.myEnumF3(c: r'C', d: r'D'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D', c: r'C'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D'))
  Assert.equals(14, myEnum.A.myEnumF4(3, b: 5, d: 6))
  Assert.equals(8, myEnum.A.myEnumF4(-1, b: 7))

  Assert.equals(10, myEnum.A.myEnumF5(a: -1))
  Assert.equals(5, myEnum.A.myEnumF5(a: -1, b: 4))
  Assert.equals(0, myEnum.A.myEnumF5(a: 7, b: -7, d: 0))
  Assert.equals(4, myEnum.A.myEnumF5(a: -1, d: -4))
  Assert.equals(-1, myEnum.A.myEnumF5(b: -1, d: -4))
  Assert.equals(0, myEnum.A.myEnumF5(d: 0, b: -7, a: 7 ))

}
