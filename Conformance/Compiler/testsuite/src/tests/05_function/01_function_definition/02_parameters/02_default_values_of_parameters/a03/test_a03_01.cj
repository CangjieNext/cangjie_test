/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a03_01

  @Level:         1

  @Assertion:     5.1.2.2(3)
                  When defining a function, you must add ! to the end of the optional parameter name because optional 
                  parameters are a kind of named parameters. 
                  Otherwise, an error is reported during compilation. 
                  defaultParameter 
                    : identifier '!' ':' type '=' expression 
                    ; 


  @Description:   Check that right syntax when optional parameters are used will not produce an error.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFunc(k!: String = "paramValue") {
  "${k}"
}

class myClass {
  func myClassFunc(f!: Bool = true) {
    return f
  }
}

struct myStruct {
  func myStructFunc(k!: String = "Ederg", l!: String = "awf") {
    "${l} ${k}"
  }
}

enum myEnum {
  A

  func myEnumFunc(c!: Rune = r'd', d!: Rune = r'c') {
    " ${c} ${d}"
  }
}

main() {
  Assert.equals(")^T*OG*", myFunc(k: ")^T*OG*"))
  Assert.equals("paramValue", myFunc())

  var myClassImpl = myClass()
  Assert.equals(true, myClassImpl.myClassFunc(f: true))
  Assert.equals(false, myClassImpl.myClassFunc(f: false))
  Assert.equals(true, myClassImpl.myClassFunc())

  var myStructImpl = myStruct()
  Assert.equals("+-+*(*Y    &   ", myStructImpl.myStructFunc(l: "+-+*(*Y", k: "   &   "))
  Assert.equals("-9_(* k=C", myStructImpl.myStructFunc(k: "k=C", l: "-9_(*"))
  Assert.equals("C Ederg", myStructImpl.myStructFunc(l: "C"))
  Assert.equals("awf Dwee", myStructImpl.myStructFunc(k: "Dwee"))
  Assert.equals("awf Ederg", myStructImpl.myStructFunc())

  Assert.equals(" C D", myEnum.A.myEnumFunc(c: r'C', d: r'D'))
  Assert.equals(" C D", myEnum.A.myEnumFunc(d: r'D', c: r'C'))
  Assert.equals(" d D", myEnum.A.myEnumFunc(d: r'D'))
  Assert.equals(" D c", myEnum.A.myEnumFunc(c: r'D'))
  Assert.equals(" d c", myEnum.A.myEnumFunc())
}
