/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a01_01

  @Level:         1

  @Assertion:     5.1.3.2(1) Functions can be declared in a function body. Such functions are referred to as nested 
                  functions. 

  @Description:   Check that the nested function can use variables and call other nested function, which are defined 
                  in the function body.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func func0(a: Int32): Int32 {
  func func1(b: Int32): Int32 {

    func func2(c: Int32): Int32 { 

      func func3(d: Int32): Int32 { 

        func func4(e: Int32): Int32 { 

          return e + 4
        }

        return func4(d) + 3
      }

      return func3(c) + 2
    }

    return func2(b)
  }

  return func1(a)
} 

class myClass {
  func myClassFunc(inVal: UInt16): String {
    let localMyClassFuncLet: UInt16 = 12
    func myNestedFunc2(a: UInt16) {
      a + a
    }
    func myNestedFunc1(a: UInt32): String {
      "${a} ${myNestedFunc2(localMyClassFuncLet)}"
      
    }
    func myNestedFunc0(): String{
      return "${myNestedFunc2(inVal)} ${myNestedFunc1(1)} ${myNestedFunc2(localMyClassFuncLet)}"
    }
    return myNestedFunc0()
  }
}

struct myStruct {
  
  var myStructVar = r'C'

  func myStructFunc() {
    func myFunc1() {
      "${true}"
    }

    func myFunc2() {
      ")(*JWAF(u "
    }

    func myFunc0(a: Rune) {

      """
      ${a}   ${myFunc2()}   ${myFunc1()}"""

    }

    return myFunc0(myStructVar)
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
  Assert.equals(14,func0(5))

  var myClassImpl = myClass()
  Assert.equals("10 1 24 24",myClassImpl.myClassFunc(5))

  var myStructImpl = myStruct()
  Assert.equals("      C   )(*JWAF(u    true",myStructImpl.myStructFunc())

  Assert.equals(8,myEnum.A.myEnumFunc())

}
