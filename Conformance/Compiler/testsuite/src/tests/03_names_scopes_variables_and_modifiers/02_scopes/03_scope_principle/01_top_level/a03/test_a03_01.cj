/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a03_01

  @Level:         1
  @Assertion:   3.2.3.1(3) Top-level variables, whose names are introduced by let and var are only accessible 
                after they are defined (including the initialization) in the same source file, 
                but in the other files of the same package can be accessible.
                and type-internal.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: ext1_a03.cj

*/

package somepackage

import utils.assert.Assert

let strTest1 = str1
let chTest1 = ch1
let numTest1 = num1
let boolTest1 = bool1
let tupleTest1 = tuple1
let rangeTest1 = range1
let structTest1 = struct1
let arrTest1 = arr1

func foo() {
  Assert.equals("abcdf", str1)
  Assert.equals('p', ch1)
  Assert.equals(3.14, num1)
  Assert.equals(true, bool1)
  Assert.equals('a', tuple1[0])
  Assert.equals(97, tuple1[1])
  Assert.equals(0..11:1, range1)
  Assert.equals(1, struct1.a)
  Assert.equals(2, struct1.b)
  Assert.equals(3, arr1[2])
  return str1
}

main() {
  Assert.equals("abcdf", str1)
  Assert.equals("abcdf", strTest1)

  Assert.equals('p', ch1)
  Assert.equals('p', chTest1)

  Assert.equals(3.14, num1)
  Assert.equals(3.14, numTest1)

  Assert.equals(true, bool1)
  Assert.equals(true, boolTest1)

  Assert.equals('a', tuple1[0])
  Assert.equals(97, tuple1[1])
  Assert.equals('a', tupleTest1[0])
  Assert.equals(97, tupleTest1[1])

  Assert.equals(0..11:1, range1)
  Assert.equals(0..11:1, rangeTest1)

  Assert.equals(struct1.a, structTest1.a)
  Assert.equals(struct1.b, structTest1.b)

  Assert.equals(arr1, arrTest1)

  Assert.equals("abcdf", foo())
  return 0
}
