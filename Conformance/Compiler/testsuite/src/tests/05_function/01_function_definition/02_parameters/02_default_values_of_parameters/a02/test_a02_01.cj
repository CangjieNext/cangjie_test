/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a02_01

  @Level:         1

  @Assertion:     5.1.2.2(2) If a default value is defined for a parameter, the function can be invoked without 
                  providing that parameter value.
                  Such parameters are referred to as optional parameters. 

  @Description:   Check that function defined with default values for parameters can be invoked with providing value 
                  and without value.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFunc1(x: String, y!: Bool = true) {
  "${x} ${y}"
}

func myFunc2(k!: String = "paramValue") {
  "${k}"
}

func myFunc3(k!: String = "paramValue", l!: Rune = r'c') {
  "${k} ${l}"
}

class myClass {
  func myClassF1(a: UInt32, b!: String = "ssdgsdgf") {
    "${b} ${a}"
  }

  func myClassF2(f!: Bool = true) {
    return f
  }

  func myClassF3(l!: Int64 = 8, m!: Int64 = 12) {
    l + m
  }

}

struct myStruct  {
  func myStructF1(h!: Int64 = 73) {
    h
  }

  func myStructF2(c: String, d!: String = "w#r$5T") {
    "${c} ${d}"
  }

  func myStructF3(a!: String = "AnUt", b!: String = "wegfsgs") {
    "${b} ${a}"
  }

}

enum myEnum {
  A

  func myEnumF1(b!: Int32 = 8) {
    b
  }

  func myEnumF2(a: Int32, b!: Int32 = 8) {
    b-a
  }

  func myEnumF3(c!: Rune = r'C', d!: Rune = r'D') {
    " ${c} ${d}"
  }

}

main() {
  Assert.equals("$%*&yrn true", myFunc1("$%*&yrn", y: true))
  Assert.equals("segsdg true", myFunc1("segsdg"))

  Assert.equals("paramValue", myFunc2())
  Assert.equals("segsdg", myFunc2(k:"segsdg"))

  Assert.equals("paramValue c", myFunc3())
  Assert.equals("segsdg c", myFunc3(k:"segsdg"))
  Assert.equals("paramValue k", myFunc3(l:r'k'))
  Assert.equals("segsdg h", myFunc3(k:"segsdg", l:r'h'))
    
  var myClassImpl = myClass()
  Assert.equals("segsdg 7", myClassImpl.myClassF1(7, b:"segsdg"))
  Assert.equals("ssdgsdgf 7", myClassImpl.myClassF1(7))
  Assert.equals(false, myClassImpl.myClassF2(f:false))
  Assert.equals(true, myClassImpl.myClassF2())
  Assert.equals(12, myClassImpl.myClassF3(l: 4, m: 8))
  Assert.equals(18, myClassImpl.myClassF3(m: 10))
  Assert.equals(16, myClassImpl.myClassF3(l: 4))
  Assert.equals(20, myClassImpl.myClassF3())

  var myStructImpl = myStruct()
  Assert.equals(73, myStructImpl.myStructF1())
  Assert.equals(16, myStructImpl.myStructF1(h:16))
  Assert.equals("@#$RRR wq3tw4", myStructImpl.myStructF2("@#$RRR", d: "wq3tw4"))
  Assert.equals("wq3tw4 w#r$5T", myStructImpl.myStructF2("wq3tw4"))
  Assert.equals("wq3tw4 7q2y", myStructImpl.myStructF3(a: "7q2y", b: "wq3tw4"))
  Assert.equals("wq3tw4 7q2y", myStructImpl.myStructF3(b: "wq3tw4", a: "7q2y"))
  Assert.equals("wegfsgs 7q2y", myStructImpl.myStructF3(a: "7q2y"))
  Assert.equals("1#%#^&7q2y AnUt", myStructImpl.myStructF3(b: "1#%#^&7q2y"))
  Assert.equals("wegfsgs AnUt", myStructImpl.myStructF3())

  Assert.equals(4, myEnum.A.myEnumF1(b:4))
  Assert.equals(8, myEnum.A.myEnumF1())
  Assert.equals(4, myEnum.A.myEnumF2(2, b:6))
  Assert.equals(6, myEnum.A.myEnumF2(2))
  Assert.equals(" C D", myEnum.A.myEnumF3(c: r'C', d: r'D'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D', c: r'C'))
  Assert.equals(" C D", myEnum.A.myEnumF3(d: r'D'))

}
