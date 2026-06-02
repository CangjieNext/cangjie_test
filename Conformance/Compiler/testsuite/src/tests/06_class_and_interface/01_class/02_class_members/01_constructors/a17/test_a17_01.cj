/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a17_01

  @Level:         1

  @Assertion: 6.1.2.1(17)
              The initial values of the member variables defined by the primary constructor
              can be set through parameters when the object is initialized.
              This is because the primary constructor generates a constructor by the compiler
              and assigns values to the member variables in the primary constructor.

  @Description: Check that variables created with the member variable parameters
                are initialized with the values passed to parameters
                during the object creation

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var for_m1 = 1

func for_m2() {
  return 2
}

class For_m4 {
  var for_m4 = 4
}

class Test {
  Test(
    public var m1: Int64,
    public let m2: Int64,
    protected var m3: Int64,
    protected let m4: Int64,
    private var m5: Int64,
    private let m6: Int64,
    var m7: Int64,
    let m8: Int64,
    public var m9!: Int64,
    public let m10!: Int64,
    protected var m11!: Int64,
    protected let m12!: Int64,
    private var m13!: Int64,
    private let m14!: Int64,
    var m15!: Int64,
    let m16!: Int64
  ) {}

  func check() {
    Assert.equals(1, m1)
    Assert.equals(2, m2)
    Assert.equals(3, m3)
    Assert.equals(4, m4)
    Assert.equals(5, m5)
    Assert.equals(6, m6)
    Assert.equals(7, m7)
    Assert.equals(8, m8)
    Assert.equals(9, m9)
    Assert.equals(10, m10)
    Assert.equals(11, m11)
    Assert.equals(12, m12)
    Assert.equals(13, m13)
    Assert.equals(14, m14)
    Assert.equals(15, m15)
    Assert.equals(16, m16)
  }
}

main() {
  let test = Test(
                  for_m1,
                  for_m2(),
                  {x: Int64 => for_m1 + x}(2),
                  For_m4().for_m4,
                  for_m1 + for_m2() * 2,
                  if (for_m1 >= 1) { for_m2() * 3 } else { 1 },
                  match(for_m2()) {case 2 => 7; case _ => 8},
                  for_m1 |> {x: Int64 => x * 8},
                  m9: (for_m1 << 3) + 1,
                  m10: {x: Unit => 10} (for (x in 1..=10:1) {for_m1++}),
                  m11: for_m1,
                  m12: for_m2() * 6,
                  m13: For_m4().for_m4 * (for_m2() + 1) + 1,
                  m14: for_m1 + For_m4().for_m4 - 1,
                  m15: For_m4().for_m4 ** 2 - 1,
                  m16: (!((for_m2() | for_m2() >> 1) | ((for_m2() | for_m2() >> 1) << 2))) & 0x1f
                  )
  test.check()
}