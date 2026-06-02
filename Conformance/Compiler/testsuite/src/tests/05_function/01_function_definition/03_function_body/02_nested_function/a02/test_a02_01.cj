/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a02_01

  @Level:         1

  @Assertion:     5.1.3.2 (2) Nested functions can capture variables and other nested functions, which are defined in 
                  the function body. 

  @Description:   Check that the nested function can use variables and call other nested function, which are defined 
                  in the function body.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func func0(a: Int32): Int32 { 
  let localLet: Int32 = 2
  func func2(n: Int32): Int32 { 
    return n + 1
  }
  func func1(): Int32 { 
    var localVar: Int32 = func2(localLet)
    return localVar
  }
  return func1()
} 

class myClass {
  func myClassFunc(inVal: String): String {
    let localMyClassFuncLet = "AAA"
    func myNestedFunc2(a: String) {
      "${a}${a} ${a}"
    }
    func myNestedFunc1(a: Int32): String {
      "${a} ${myNestedFunc2(localMyClassFuncLet)}"
      
    }
    func myNestedFunc0(): String{
      return "${myNestedFunc2(inVal)} ${myNestedFunc1(1)} ${myNestedFunc2(localMyClassFuncLet)}"
    }
    return myNestedFunc0()
  }
}

enum myEnum {
  A

  func myEnumFunc() {
    var localVar0: Int64 = 4
    func myNestedFunc0() {
      var localVar1 = localVar0
      func myNestedFunc1() {
        var localVar2 = localVar0
        localVar2
      }
      localVar1 + myNestedFunc1()
    }
    myNestedFunc0()
  }
}
main() {
  Assert.equals(3,func0(5))

  var myClassImpl = myClass()
  Assert.equals("55 5 1 AAAAAA AAA AAAAAA AAA",myClassImpl.myClassFunc("5"))

  Assert.equals(8,myEnum.A.myEnumFunc())

}
