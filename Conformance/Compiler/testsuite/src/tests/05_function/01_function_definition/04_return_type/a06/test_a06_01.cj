/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a06_01

  @Level:         1

  @Assertion:     5.1.4(6) Specifically, if the return type of a function is specified as Unit (such as 
                  func f(x:Bool):Unit { x }), the compilier compiler will atomatically insert return () at all 
                  possible places where the function could return in the function body, so that the return type 
                  of the function is always Unit. 

  @Description:   Check that function defined as function with return type Unit will always return value with type
                  Unit.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func myFunc<T>(a: T): Unit {a}

func myFunc1(): Unit { return ()}

main() {
  Assert.isTrue(myFunc(true) is Unit)
  Assert.isTrue(myFunc("true") is Unit)
  Assert.isTrue(myFunc(12.5) is Unit)
  Assert.isTrue(myFunc((6, true, "HHH")) is Unit)
  Assert.isTrue(myFunc(6) is Unit)

  Assert.isTrue(myFunc1() is Unit)
}
