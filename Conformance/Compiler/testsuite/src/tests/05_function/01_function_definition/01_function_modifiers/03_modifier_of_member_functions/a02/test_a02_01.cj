/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a02_01

  @Level:         1

  @Assertion:     5.1.1.3(2) Interface member functions can have the following modifiers: static and mut. 
                  For details, see Interface Members.

  @Description:   Check that interface member function definition may use function modifiers: mut and static.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface1 {
  static func myStaticFunc1(): Unit
  static func myStaticFunc2(): String {"myStaticFunc2 return"}
}

interface myInterface2 {
  mut func myMutFunc(a: Float32) {}
}

class myClass <: myInterface1 {
  static private var myStaticPrivateVar = 10

  static public func myStaticFunc2(): String {
    "myClass myStaticFunc2 return"
  }

  static public func myStaticFunc1(): Unit {
    myStaticPrivateVar = 4
  }

  static public func myStaticFunc3(): Int64 {
    myStaticPrivateVar
  }

}

main() {

  Assert.equals("myStaticFunc2 return", myInterface1.myStaticFunc2())

  Assert.equals("myClass myStaticFunc2 return", myClass.myStaticFunc2())
  myClass.myStaticFunc1()
  Assert.equals(4, myClass.myStaticFunc3())
}
