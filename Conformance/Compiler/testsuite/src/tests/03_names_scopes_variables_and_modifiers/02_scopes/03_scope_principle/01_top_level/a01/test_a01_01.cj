/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a01_01

  @Level:         1
  @Assertion:   3.2.3.1(1) Names declared or defined at the top-level of a source file (i.e., not enclosed in {}) 
                have top-level scope.
  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

let str1 = "abcdf"
let str2 = str1

let ch1 = 'p'
let ch2 = ch1

let num1 = 3.14
let num2 = num1

let bool1 = true
let bool2 = bool1

let tuple1 = ('a', 97)
let tuple2 = tuple1

let range1 = 0..11:1
let range2 = range1

struct Struct1 {
  let a = 1
  var b = 2
}
let struct1 = Struct1()
let struct2 = struct1

let arr1 = [1, 2, 3, 4, 5]
let arr2 = arr1

interface Inter1 {
    func getInt(): Int64
}

open class X <: Inter1 {
  let str3 = str1
  let ch3 = ch1
  let num3 = num1
  let bool3 = bool1
  let tuple3 = tuple1
  let range3 = range1
  let struct3 = struct1
  let arr3 = arr1
  public override func getInt(){ 123 }
}

let xObj3 = X()
let foo1 = foo
let unit1 = ()
let unit2 = unit1

enum E { A ; | B ; | C }
let eValue = E.A

main() {
  Assert.equals("abcdf", foo())
  Assert.equals("abcdf", foo1())
  
  Assert.equals("abcdf", str1)
  Assert.equals("abcdf", str2)

  Assert.equals('p', ch1)
  Assert.equals('p', ch2)

  Assert.equals(3.14, num1)
  Assert.equals(3.14, num2)

  Assert.equals(true, bool1)
  Assert.equals(true, bool2)

  Assert.equals('a', tuple1[0])
  Assert.equals(97, tuple1[1])
  Assert.equals('a', tuple2[0])
  Assert.equals(97, tuple2[1])

  Assert.equals(0..11:1, range1)
  Assert.equals(0..11:1, range2)

  Assert.equals(struct1.a, struct2.a)
  Assert.equals(struct1.b, struct2.b)

  Assert.equals(arr1, arr2)

  let xObj2 = X()
  Assert.equals("abcdf", xObj2.str3)
  Assert.equals('p', xObj2.ch3)
  Assert.equals(3.14, xObj2.num3)
  Assert.equals(true, xObj2.bool3)
  Assert.equals('a', xObj2.tuple3[0])
  Assert.equals(97, xObj2.tuple3[1])
  Assert.equals(0..11:1, xObj2.range3)
  Assert.equals(struct1.a, xObj2.struct3.a)
  Assert.equals(struct1.b, xObj2.struct3.b)
  Assert.equals(arr1, xObj2.arr3)
  Assert.equals(123, xObj2.getInt())

  Assert.equals("abcdf", xObj3.str3)
  Assert.equals('p', xObj3.ch3)
  Assert.equals(3.14, xObj3.num3)
  Assert.equals(true, xObj3.bool3)
  Assert.equals('a', xObj3.tuple3[0])
  Assert.equals(97, xObj3.tuple3[1])
  Assert.equals(0..11:1, xObj3.range3)
  Assert.equals(struct1.a, xObj3.struct3.a)
  Assert.equals(struct1.b, xObj3.struct3.b)
  Assert.equals(arr1, xObj3.arr3)

  Assert.isTrue(unit1 == unit2)
  Assert.isTrue(eValue is E)
  return 0
}

func foo(): String {
  Assert.equals("abcdf", str1)
  Assert.equals("abcdf", str2)

  Assert.equals('p', ch1)
  Assert.equals('p', ch2)

  Assert.equals(3.14, num1)
  Assert.equals(3.14, num2)

  Assert.equals(true, bool1)
  Assert.equals(true, bool2)

  Assert.equals('a', tuple1[0])
  Assert.equals(97, tuple1[1])
  Assert.equals('a', tuple2[0])
  Assert.equals(97, tuple2[1])

  Assert.equals(0..11:1, range1)
  Assert.equals(0..11:1, range2)

  Assert.equals(struct1.a, struct2.a)
  Assert.equals(struct1.b, struct2.b)

  Assert.equals(arr1, arr2)

  let xObj = X()
  Assert.equals("abcdf", xObj.str3)
  Assert.equals('p', xObj.ch3)
  Assert.equals(3.14, xObj.num3)
  Assert.equals(true, xObj.bool3)
  Assert.equals('a', xObj.tuple3[0])
  Assert.equals(97, xObj.tuple3[1])
  Assert.equals(0..11:1, xObj.range3)
  Assert.equals(struct1.a, xObj.struct3.a)
  Assert.equals(struct1.b, xObj.struct3.b)
  Assert.equals(arr1, xObj.arr3)

  return str1
}