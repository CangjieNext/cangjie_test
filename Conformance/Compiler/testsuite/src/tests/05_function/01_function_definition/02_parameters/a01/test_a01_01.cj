/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a01_01

  @Level:         1

  @Assertion:     5.1.2(1) The sequence of parameters in the parameter list is as follows: 
                    non-named parameters, 
                    named parameter(including named parameter but no default values, and 
                    parameters with default values). 

  @Description:   Check that we can use list of parameters for function definition.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
  func myInterfaceFunc(a: String, b!: String, c!: String): String
}

func myFuncWithNonNamedParameters(a: Int32, b: UInt16, c: Rune) {
  "${a} ${b} ${c}"
}

func myFuncWithNamedParameters(x!: String, y!: Bool) {
  "${x} ${y}"
}

func myFuncWithNamedParameterAndDefaultValue(k!: String = "paramValue") {
  "${k}"
}

func myFuncWithAnyParameters(l: Int64 , m!: Int32 = 1, n!: Rune) {
  "${l} ${m} ${n}"
}

class myClass {
  func myClassF1(a:Int32) {
    a
  }

  func myClassF2(a: UInt32, b!: String) {
    "${b} ${a}"
  }

  func myClassF3(f!: Bool = true) {
    return f
  }

  func myClassF4(k: Int64, l!: Int64 = 8, m!: Int64) {
    k + l + m
  }

}

struct myStruct <: myInterface {
  public func myInterfaceFunc(a: String, b!: String = "A#A", c!: String): String {
    "${a} ${b} ${c}"
  }
  func myStructF1(h: Float32) {
    h
  }

  func myStructF2(c!: String, d!: String) {
    "${c} ${d}"
  }

  func myStructF3(a!: String = "AnUt", b!: String = "wegfsgs") {
    "${b} ${a}"
  }

  func myStructF4(a: String, b!: Int32 = 10, c!: UInt16) {
    "${a} ${c} ${b}"
  }

}

enum myEnum {
  A

  func myEnumF1(g: Int64) {
    g * 2
  }

  func myEnumF2(a: Int32, b!: Int32) {
    b-a
  }

  func myEnumF3(c!: Rune = r'C', d!: Rune) {
    " ${c} ${d}"
  }

  func myEnumF4(a: Int32, b!: Int32, d!: Int32 = 2) {
    a + b + d
  }
}

main() {
  Assert.equals("1 15 C", myFuncWithNonNamedParameters(1, 15, r'C'))

  Assert.equals("FgE23532 true", myFuncWithNamedParameters(y: true, x: "FgE23532"))
  Assert.equals("23fsdfse@@E2* false", myFuncWithNamedParameters(x: "23fsdfse@@E2*", y: false))

  Assert.equals("%owefFgE23532", myFuncWithNamedParameterAndDefaultValue(k: "%owefFgE23532"))
  Assert.equals("paramValue", myFuncWithNamedParameterAndDefaultValue())

  Assert.equals("22 16 v", myFuncWithAnyParameters(22, m: 16, n: r'v'))
  Assert.equals("-6 1 u", myFuncWithAnyParameters(-6, n: r'u'))

  var myClassImpl = myClass()
  Assert.equals(7, myClassImpl.myClassF1(7))
  Assert.equals(" 083r 1", myClassImpl.myClassF2(1, b:" 083r"))
  Assert.equals(false, myClassImpl.myClassF3(f:false))
  Assert.equals(true, myClassImpl.myClassF3())
  Assert.equals(18, myClassImpl.myClassF4(6, l: 4, m: 8))
  Assert.equals(20, myClassImpl.myClassF4(2, m: 10))

  var myStructImpl = myStruct()
  Assert.equals("A UUU ZZZ", myStructImpl.myInterfaceFunc("A", b: "UUU", c: "ZZZ"))
  Assert.equals("A A#A ZZZ", myStructImpl.myInterfaceFunc("A", c: "ZZZ"))
  var inH: Float32 = 16.23
  Assert.equals(inH, myStructImpl.myStructF1(16.23))
  Assert.equals("wq3tw4 @#$RRR", myStructImpl.myStructF2(c: "wq3tw4", d: "@#$RRR"))
  Assert.equals("wq3tw4 @#$RRR", myStructImpl.myStructF2(d: "@#$RRR", c: "wq3tw4"))

  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(a: "wq3tw4", b: "@#$RRR"))
  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF3(b: "@#$RRR", a: "wq3tw4"))
  Assert.equals("@#$RRR AnUt", myStructImpl.myStructF3(b: "@#$RRR"))
  Assert.equals("wegfsgs wq3tw4", myStructImpl.myStructF3(a: "wq3tw4"))
  Assert.equals("wegfsgs AnUt", myStructImpl.myStructF3())

  Assert.equals("SSS 7 -5", myStructImpl.myStructF4("SSS", b: -5, c: 7))
  Assert.equals("SSS 12 6", myStructImpl.myStructF4("SSS", c: 12, b: 6))
  Assert.equals("SSS 4 10", myStructImpl.myStructF4("SSS", c: 4))


  Assert.equals(8, myEnum.A.myEnumF1(4))
  Assert.equals(4, myEnum.A.myEnumF2(2, b:6))
  Assert.equals(" C D", myEnum.A.myEnumF3(c: r'C', d: r'D'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D', c: r'C'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D'))
  Assert.equals(14, myEnum.A.myEnumF4(3, b: 5, d: 6))
  Assert.equals(8, myEnum.A.myEnumF4(-1, b: 7))

}
