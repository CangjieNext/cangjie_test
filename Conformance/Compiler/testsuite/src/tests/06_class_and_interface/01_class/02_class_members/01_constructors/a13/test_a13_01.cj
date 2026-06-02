 /*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a13_01

  @Level:         1

  @Assertion: 6.1.2.1(13)
              In addition, it is supported by using ! indicates whether the parameter is a named parameter.

  @Description: Check that member variable parameters can be named

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

class TestNoDefaults {
  TestNoDefaults(
    public let a!: Int64,
    public var b!: Float64,
    protected let c!: String,
    protected var d!: Rune,
    private let e!: (Int64, Int64),
    private var f!: () -> Int64,
    let g!: Array<Int64>,
    var h!: Bool
  ) {}

  func check() {
    Assert.equals(12, a)
    Assert.approxEquals(24.31, b)
    Assert.equals("a", c)
    Assert.equals(r'a', d)
    Assert.equals(-8, e[0])
    Assert.equals(31, e[1])
    Assert.equals(7, f())
    Assert.equals([1, 2], g)
    Assert.equals(true, h)
  }
}

class TestDefaults {
  TestDefaults(
    public let a!: Int64 = 5,
    public var b!: Float64 = 0.18,
    protected let c!: String = "ssss",
    protected var d!: Rune = r']',
    private let e!: (Int64, Int64) = (10, 10),
    private var f!: (Int64) -> Int64 = {x: Int64 => x + 1},
    let g!: Array<Int64> = [],
    var h!: Bool = true
  ) {}

  func check() {
    Assert.equals(5, a)
    Assert.approxEquals(0.18, b)
    Assert.equals("ssss", c)
    Assert.equals(r']', d)
    Assert.equals(10, e[0])
    Assert.equals(10, e[1])
    Assert.equals(6, f(5))
    Assert.equals([], g)
    Assert.equals(true, h)
  }
}

class TestDefaultsOverwritten {
  TestDefaultsOverwritten(
    public let a!: Int64 = 5,
    public var b!: Float64 = 0.18,
    protected let c!: String = "ssss",
    protected var d!: Rune = r']',
    private let e!: (Int64, Int64) = (10, 10),
    private var f!: (Int64) -> Int64 = {x: Int64 => x + 1},
    let g!: Array<Int64> = [],
    var h!: Bool = true
  ) {}

  func check() {
    Assert.equals(0, a)
    Assert.approxEquals(-1.777777777e-77, b)
    Assert.equals("ssspppp", c)
    Assert.equals(r'(', d)
    Assert.equals(1, e[0])
    Assert.equals(1, e[1])
    Assert.equals(4, f(5))
    Assert.equals([0, 0, 0], g)
    Assert.equals(false, h)
  }
}

main() {
  let case1 = TestNoDefaults(a: 12, b: 24.31, c: "a", d: r'a', e: (-8, 31), f: { => 7 }, g: [1, 2], h: true)
  case1.check()

  let case2 = TestDefaults()
  case2.check()

  let case3 = TestDefaultsOverwritten(a: 0, b: -1.777777777e-77, c: "ssspppp", d: r'(', e: (1, 1),
    f: {x: Int64 => x - 1}, g: [0, 0, 0], h: false)
  case3.check()
}