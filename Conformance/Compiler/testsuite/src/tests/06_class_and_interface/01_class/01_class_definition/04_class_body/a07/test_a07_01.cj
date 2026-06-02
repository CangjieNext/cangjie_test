/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a07_01

  @Level:         1

  @Assertion: 6.1.1.4(7)
              A class can define only one primary constructor or not.

  @Description: Check that a class can define one primary constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var call_indicator = 0

class SimpleConst {
  SimpleConst() {
    call_indicator++
    m = 94
  }
  var m: Int64
}

class ConstWithParams {
  ConstWithParams(x: String, y: Bool, z: Int64) {
    call_indicator++
    a = x
    b = y
    c = z
  }
  let a: String
  let b: Bool
  let c: Int64
}

class GenericConst<T, U> {
  GenericConst(x: T, y: U) {
    call_indicator++
    a = x
    b = y
  }

  var a: T
  var b: U
}

class ConstWithMemParam {
  ConstWithMemParam(var x: Int64) {
    call_indicator++
  }
}

class ConstWithOtherMembers {
  init(x: Int64) {}
  ConstWithOtherMembers() {
    call_indicator++
  }

  func f1() {}
  operator func !() {
    return false
  }
}

class ConstWithNoMembers {
  ConstWithNoMembers(x: Int64) {
    call_indicator++
  }
}

main() {
  Assert.equals(0, call_indicator)

  var a = SimpleConst()
  Assert.equals(1, call_indicator)
  Assert.equals(94, a.m)

  var b = ConstWithParams("s", true, 12)
  Assert.equals(2, call_indicator)
  Assert.equals("s", b.a)
  Assert.equals(true, b.b)
  Assert.equals(12, b.c)

  var c = GenericConst<Rune, Int32>(r't', 128i32)
  Assert.equals(3, call_indicator)
  Assert.equals(r't', c.a)
  Assert.equals(128i32, c.b)

  var d = ConstWithMemParam(55)
  Assert.equals(4, call_indicator)
  Assert.equals(55, d.x)

  var e = ConstWithOtherMembers()
  Assert.equals(5, call_indicator)

  var f = ConstWithNoMembers(524)
  Assert.equals(6, call_indicator)
}
