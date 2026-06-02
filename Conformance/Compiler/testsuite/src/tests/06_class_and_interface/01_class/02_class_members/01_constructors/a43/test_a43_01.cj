/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a43_01

  @Level:         1

  @Assertion: 6.1.2.1(43)
              Like any function, If no constructor of the corresponding parameter type is matched
              or no accessible constructor exists, the compiler reports an error .

  @Description: Check that a matching constructor is invoked without errors during instantiation

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var const_id = 0

struct S {}

enum E { E1 | E2 }

class ManyTypes {
  init(x: Int8) {
    const_id = 1
  }

  init(x: Int16) {
    const_id = 2
  }

  init(x: Int32) {
    const_id = 3
  }

  init(x: Int64) {
    const_id = 4
  }

  init(x: UInt8) {
    const_id = 5
  }

  init(x: UInt16) {
    const_id = 6
  }

  init(x: UInt32) {
    const_id = 7
  }

  init(x: UInt64) {
    const_id = 8
  }

  init(x: Float16) {
    const_id = 9
  }

  init(x: Float32) {
    const_id = 10
  }

  init(x: Float64) {
    const_id = 11
  }

  init(x: Rune) {
    const_id = 12
  }

  init(x: Bool) {
    const_id = 13
  }

  init(x: Unit) {
    const_id = 14
  }

  init(x: String) {
    const_id = 15
  }

  init(x: (Rune, Rune)) {
    const_id = 16
  }

  init(x: (String, String)) {
    const_id = 17
  }

  init(x: Range<Int64>) {
    const_id = 18
  }

  init(x: () -> Int64) {
    const_id = 19
  }

  init(x: (Int64) -> Int64) {
    const_id = 20
  }

  init(x: (String) -> Unit) {
    const_id = 21
  }

  init(x: S) {
    const_id = 22
  }

  init(x: E) {
    const_id = 23
  }

  init(x: Object) {
    const_id = 24
  }
}

class ManyParameters<T1, T2> {
  init() {
    const_id = 25
  }

  init(x1: T1) {
    const_id = 26
  }

  init(x1: T1, x2: T1) {
    const_id = 27
  }

  init(x1: T1, x2: T1, x3: T1) {
    const_id = 28
  }

  init(x1: T1, x2: T1, x3: T1, x4: T1) {
    const_id = 29
  }

  init(x1: T1, x2: T1, x3: T1, x4: T1, x5: T1) {
    const_id = 30
  }

  init(x1: T1, x2: T1, x3: T1, x4: T1, x5: T1, x6: T1, x7: T1, x8: T1, x9: T1, x10: T1,
       x11: T1, x12: T1, x13: T1, x14: T1, x15: T1, x16: T1, x17: T1, x18: T1, x19: T1, x20: T1,
       x21: T1, x22: T1, x23: T1, x24: T1, x25: T1, x26: T1, x27: T1, x28: T1, x29: T1, x30: T1,
       x31: T1, x32: T1, x33: T1, x34: T1, x35: T1, x36: T1, x37: T1, x38: T1, x39: T1, x40: T1,
       x41: T1, x42: T1, x43: T1, x44: T1, x45: T1, x46: T1, x47: T1, x48: T1, x49: T1, x50: T1) {
        const_id = 50
      }
}

class Variadic {
  init(x1!: Int64 = 1, x2!: Int64 = 2, x3!: Int64 = 3, x4!: Int64 = 4, x5!: Int64 = 5) {
    const_id++
  }
}

main() {
  let case1 = ManyTypes(1i8)
  Assert.equals(1, const_id)

  let case2 = ManyTypes(1i16)
  Assert.equals(2, const_id)

  let case3 = ManyTypes(1i32)
  Assert.equals(3, const_id)

  let case4 = ManyTypes(1)
  Assert.equals(4, const_id)

  let case5 = ManyTypes(1u8)
  Assert.equals(5, const_id)

  let case6 = ManyTypes(1u16)
  Assert.equals(6, const_id)

  let case7 = ManyTypes(1u32)
  Assert.equals(7, const_id)

  let case8 = ManyTypes(1u64)
  Assert.equals(8, const_id)

  let case9 = ManyTypes(0.0001f16)
  Assert.equals(9, const_id)

  let case10 = ManyTypes(0.0001f32)
  Assert.equals(10, const_id)

  let cas11 = ManyTypes(0.0001)
  Assert.equals(11, const_id)

  let case12 = ManyTypes(r'a')
  Assert.equals(12, const_id)

  let case13 = ManyTypes(false)
  Assert.equals(13, const_id)

  let case14 = ManyTypes(())
  Assert.equals(14, const_id)

  let cas15 = ManyTypes("Ofhq")
  Assert.equals(15, const_id)

  let case16 = ManyTypes((r'a', r'b'))
  Assert.equals(16, const_id)

  let case17 = ManyTypes(("a", "b"))
  Assert.equals(17, const_id)

  let cas18 = ManyTypes(1..100:1)
  Assert.equals(18, const_id)

  let case19 = ManyTypes({ => 1})
  Assert.equals(19, const_id)

  let case20 = ManyTypes({x: Int64 => x})
  Assert.equals(20, const_id)

  let cas21 = ManyTypes({x: String => return ()})
  Assert.equals(21, const_id)

  let case22 = ManyTypes(S())
  Assert.equals(22, const_id)

  let case23 = ManyTypes(E.E1)
  Assert.equals(23, const_id)

  let case24 = ManyTypes(case1)
  Assert.equals(24, const_id)

  let case25 = ManyParameters<Int64, ()->Unit>()
  Assert.equals(25, const_id)

  let case26 = ManyParameters<Bool, Bool>(true)
  Assert.equals(26, const_id)

  let case27 = ManyParameters<String, Range<Int32>>("a", "b")
  Assert.equals(27, const_id)

  let case28 = ManyParameters<(Int64, Int64), Bool>((1, 2), (3, 4), (5, 6))
  Assert.equals(28, const_id)

  let case29 = ManyParameters<Rune, Int32>(r'a', r'b', r'c', r'd')
  Assert.equals(29, const_id)

  let case30 = ManyParameters<Int64, Float64>(1, 2, 3, 4, 5)
  Assert.equals(30, const_id)

  let case31 = ManyParameters<Unit, String>((), (), (), (), (), (), (), (), (), (),
                                            (), (), (), (), (), (), (), (), (), (),
                                            (), (), (), (), (), (), (), (), (), (),
                                            (), (), (), (), (), (), (), (), (), (),
                                            (), (), (), (), (), (), (), (), (), ())
  Assert.equals(50, const_id)

  let case32 = Variadic()
  Assert.equals(51, const_id)

  let case33 = Variadic(x1: 10)
  Assert.equals(52, const_id)

  let case34 = Variadic(x1: 10, x2: 10)
  Assert.equals(53, const_id)

  let case35 = Variadic(x1: 10, x2: 10, x3: 1)
  Assert.equals(54, const_id)

  let case36 = Variadic(x1: 10, x2: 10, x3: 1, x4: 1)
  Assert.equals(55, const_id)

  let case37 = Variadic(x1: 10, x2: 10, x3: 1, x4: 1, x5: 1)
  Assert.equals(56, const_id)

  let case38 = Variadic(x2: 10, x3: 1, x4: 1, x5: 1)
  Assert.equals(57, const_id)

  let case39 = Variadic(x3: 1, x4: 1, x5: 1)
  Assert.equals(58, const_id)

  let case40 = Variadic(x4: 1, x5: 1)
  Assert.equals(59, const_id)

  let case41 = Variadic(x5: 1)
  Assert.equals(60, const_id)
}