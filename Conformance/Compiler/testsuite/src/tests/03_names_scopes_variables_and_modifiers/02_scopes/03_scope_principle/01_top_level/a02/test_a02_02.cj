/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a02_02

  @Level:         1
  @Assertion:   3.2.3.1(2) The scope of top-level functions, types (including class, interface, enum, struct, and type)
                is the entire package, and thus they are accessible in the entire package.
                and type-internal.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: ext1_a02.cj

*/

package somepackage

import utils.assert.Assert

let foo = someFunc
var foo2 = someFunc
let structTest1 = Struct1()
var structTest2 = Struct1()
let classTest1 = Class1()
var classTest2 = Class1()

open class Class2 <: Inter1 {
  public override func getInt() { 1408 }
}

var interfaceTest1 = Class2()
let enumTest1 = AbcEnum.A
var enumTest2 = AbcEnum.B

main() {
  Assert.equals("bla-bla-result123!", foo())
  Assert.equals("bla-bla-result123!", foo2())

  Assert.equals(1, structTest1.a)
  Assert.equals(2, structTest1.b)
  Assert.equals(1, structTest2.a)
  Assert.equals(2, structTest2.b)

  Assert.equals(6.7523468, classTest1.c)
  Assert.equals(5, classTest1.d[1])
  Assert.equals(6.7523468, classTest2.c)
  Assert.equals(4, classTest2.d[2])

  Assert.equals(1408, interfaceTest1.getInt())

  Assert.isTrue(enumTest1 is AbcEnum)
  Assert.isTrue(enumTest2 is AbcEnum)
  return 0
}
