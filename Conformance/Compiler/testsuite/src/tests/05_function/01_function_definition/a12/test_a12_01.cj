/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a12_01

  @Level:         1

  @Assertion:     5.1(12) The following is an example of function definition.
                  It does not use the access modifier to indicate that the function can be accessible inside the 
                  package. The function name is foo. 
                  It has a parameter named a of the Int64 type, and has the return type of Int64. The function body 
                  simply returns a. 
                  func foo(a: Int64): Int64 { a }

  @Description:   Example of function definition from specification.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert
func foo(a: Int64): Int64 { a }
main() {
  var myA = 12
  Assert.equals(foo(myA),myA)
  Assert.isTrue(foo(myA) is Int64)
  myA = 999
  Assert.equals(foo(myA),myA)
  Assert.isTrue(foo(myA) is Int64)
  Assert.equals(foo(-318),-318)
  Assert.isTrue(foo(-318) is Int64)
}
