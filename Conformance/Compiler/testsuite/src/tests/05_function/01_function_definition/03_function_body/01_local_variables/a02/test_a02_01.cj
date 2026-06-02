/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a02_01

  @Level:         1

  @Assertion:     5.1.3.1(2) Local variables can be similarly declared with var or let. In the latter case, the 
                  variables are immutable. 

  @Description:   Check that local variables can be declared in function body and variables declared with 'var'
                  keyword are mutable.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func func0(): Unit { 
  var a = 1 
  let b = 1 
  Assert.equals(1, a)
  Assert.equals(1, b)
  a = 2
  Assert.equals(2, a)
} 

func func1(a: Rune) {
  var localVar: Rune = r'g'
  let localLet: String = "dfgs"
  Assert.equals(r'g', localVar)
  Assert.equals("dfgs", localLet)
  localVar = a 
  Assert.equals(a, localVar)
  func nestedFunc() {
    var localVar0: Float32 = 12.3
    let localLet0: UInt8 = 2
    Assert.equals(12.3, localVar0)
    Assert.equals(2, localLet0)
    localVar0 = 0.23 
    Assert.equals(0.23, localVar0)
    localVar = r'r'
    Assert.equals(r'r', localVar)
  }
  nestedFunc()
}

class myClass {
  func myClassFunc(f!: Bool = true) {
    var localVar = f
    let localLet = !f
    Assert.equals(f, localVar)
    Assert.equals(!f, localLet)
    localVar = !f
    Assert.equals(!f, localVar)
    return f
  }
}

struct myStruct {
  func myStructFunc(k!: String = "Ederg", l!: String = "awf") {
    var localVar = "safsdf"
    let localLet = (2, true, r'D')
    Assert.equals("safsdf", localVar)
    Assert.equals(2, localLet[0])
    Assert.equals(true, localLet[1])
    Assert.equals(r'D', localLet[2])
    localVar = "s@af%sd*f"
    Assert.equals("s@af%sd*f", localVar)
    "${l} ${k}"
  }
}

enum myEnum {
  A

  func myEnumFunc(c!: Rune = r'd', d!: Rune = r'c') {
    var localVar = d
    let localLet = c
    Assert.equals(d, localVar)
    Assert.equals(c, localLet)
    localVar = r'q'
    Assert.equals(r'q', localVar)
    " ${c} ${d}"
  }
}

main() {
  func0()
  func1(r'F')

  var myClassImpl = myClass()
  Assert.equals(true, myClassImpl.myClassFunc())

  var myStructImpl = myStruct()
  Assert.equals("awf Ederg", myStructImpl.myStructFunc())

  Assert.equals(" C D", myEnum.A.myEnumFunc(c: r'C', d: r'D'))

}
