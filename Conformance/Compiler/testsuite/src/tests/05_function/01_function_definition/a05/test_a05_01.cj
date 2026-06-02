/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a05_01

  @Level:         1

  @Assertion:     5.1(5) List of optional type parameters following the function name. The type parameter list is 
                  enclosed by <>. Multiple type parameters are separated by comma.

  @Description:   Check different variants of function definition with optional type parameters.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface Sub<T> { 
  func sub(other: T): T 
} 

extend Int64 <: Sub<Int64> { 
  public func sub(other: Int64): Int64 { 
    return this - other 
  } 
} 
func mySub<T>(x: T, y: T) where T <: Sub<T> {
  return x.sub(y) 
}
func concatOneTypeValues<T>(x: T, y: T):String where T <: ToString {
  return "${x.toString()} ${y.toString()}"
}
func concatTwoTypeValues<T,S>(x: T, y: S):String where T <: ToString,  S <: ToString {
  return "${x.toString()} + ${y.toString()}"
}
main() {
  var myVar = mySub(6,4)
  Assert.equals(2, myVar)
  Assert.equals(concatOneTypeValues("A", "b"),"A b")
  Assert.equals(concatOneTypeValues(12, 7),"12 7")
  Assert.equals(concatTwoTypeValues("test_str", 7),"test_str + 7")
  Assert.equals(concatTwoTypeValues(24.67, true),"24.670000 + true")
}
