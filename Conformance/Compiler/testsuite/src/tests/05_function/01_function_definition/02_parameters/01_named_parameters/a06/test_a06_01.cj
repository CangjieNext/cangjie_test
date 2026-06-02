/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a06_01

  @Level:         1

  @Assertion:     5.1.2.1(6) If an abstract function or open-modified function has named formal parameters, then an 
                  implementation function or override-modified function needs to keep the same named formal parameters. 

  @Description:   Check that implementation of abstarct or override-modified function with the same named formal 
                  parameters will not produce an error.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
  func myNamedParamFunc(a!: String, b!: Bool): String {
    if(b) {
      a
    }else{
      "else"
    }
  }
  func myAbstaractNamedParamFunc(x!: Int32, y!: Int32): String
}

open class myOpenClass { 
  public open func f(a!: Int32, c!: Int32 ): Int32 { 
    return a + c 
  } 
} 

abstract class myAbstactClass { 
  public func foo(c!: String): String
} 

class myClass0 <: myOpenClass { 
  public override func f(a!: Int32, c!: Int32 ) : Int32 { 
    return a - c 
  } 
}

class myClass1 <: myAbstactClass { 
  public func foo(c!: String): String { 
    c
  } 
}

struct myStruct <: myInterface {
  public override func myNamedParamFunc(a!: String, b!: Bool): String {
    if(!b) {
      a
    }else{
      "else"
    }
  }
  public func myAbstaractNamedParamFunc(x!: Int32, y!: Int32): String {
    "${y} ${x}"
  }
}

main() {

  var myOpenClassImpl = myOpenClass()
  Assert.equals(24,myOpenClassImpl.f(a: 16, c: 8))
  Assert.equals(24,myOpenClassImpl.f(c: 8, a: 16))

  var myClass0Impl = myClass0()
  Assert.equals(8,myClass0Impl.f(a: 16, c: 8))
  Assert.equals(8,myClass0Impl.f(c: 8, a: 16))

  var myClass1Impl = myClass1()
  Assert.equals("wegfdsg",myClass1Impl.foo(c: "wegfdsg"))

  let myStructImpl = myStruct()
  Assert.equals("else",myStructImpl.myNamedParamFunc(b: true, a: "wegfdsg"))
  Assert.equals("else",myStructImpl.myNamedParamFunc(a: "wegfdsg", b: true))
  Assert.equals("wegf254zxdsg",myStructImpl.myNamedParamFunc(a: "wegf254zxdsg", b: false))
  Assert.equals("wegf254zxdsg",myStructImpl.myNamedParamFunc(b: false, a: "wegf254zxdsg"))
  Assert.equals("-72 12",myStructImpl.myAbstaractNamedParamFunc(x: 12, y: -72))
  Assert.equals("-72 12",myStructImpl.myAbstaractNamedParamFunc(y: -72, x: 12))
}
