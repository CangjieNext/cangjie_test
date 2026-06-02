/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a02_03

  @Level:         1
  @Assertion:   3.2.3.1(2) The scope of top-level functions, types (including class, interface, enum, struct, and type)
                is the entire package, and thus they are accessible in the entire package.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: ext_a02_03.cj

*/

package somepackage3

internal import utils.assert.Assert

main() {
  checkTypeInternal()
  
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

// Function
func someFunc(): String {
    return "bla-bla-result123!";
}

// Structure
struct Struct1 {
  let a = 1
  var b = 2
}

// Class
open class Class1 {
  let c = 6.7523468
  var d = [6,5,4,3]
}

// Interface
interface Inter1 {
    func getInt(): Int64
}

// Enum
enum AbcEnum { A ; | B ; | C }
