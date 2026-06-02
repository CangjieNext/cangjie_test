/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a01_02

  @Level:         1
  @Assertion:   3.2.3.1(1) Names declared or defined at the top-level of a source file (i.e., not enclosed in {}) 
                have top-level scope.
  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

var str1 = "abcdf"
var str2 = str1

var ch1 = 'p'
var ch2 = ch1

var num1 = 3.14
var num2 = num1

var bool1 = true
var bool2 = bool1

var tuple1 = ('a', 97)
var tuple2 = tuple1

var range1 = 0..11:1
var range2 = range1

struct Struct1 {
  var a = 1
  var b = 2
}
var struct1 = Struct1()
var struct2 = struct1

var arr1 = [1, 2, 3, 4, 5]
var arr2 = arr1

open class X {
  var str3 = str1
  var ch3 = ch1
  var num3 = num1
  var bool3 = bool1
  var tuple3 = tuple1
  var range3 = range1
  var struct3 = struct1
  var arr3 = arr1
}

var xObj3 = X()
var foo1 = foo
var unit1 = ()
var unit2 = unit1

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

  var xObj2 = X()
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

  var xObj = X()
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