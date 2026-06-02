/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a01_04

  @Level:         1

  @Assertion: 6.2.5(1)
              The Any interface is a language built-in empty interface,
              which is by default inherited by all interface types and
              implemented by all non-interface types,
              so all types can be used as subtypes of the Any type.

  @Description: Check that any type can be assigned to a variable of the type Any

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006077

*/

import utils.assert.Assert

main() {
    var tst: Any

    let t1: Object = Object()
    tst = t1
    Assert.isTrue(tst is Any)

    let t2: Int64 = 1
    tst = t2
    Assert.isTrue(tst is Any)

    let t3: Int32 = 1
    tst = t3
    Assert.isTrue(tst is Any)

    let t4: Int16 = 1
    tst = t4
    Assert.isTrue(tst is Any)

    let t5: Int8 = 1
    tst = t5
    Assert.isTrue(tst is Any)

    let t6: UInt64 = 1
    tst = t6
    Assert.isTrue(tst is Any)

    let t7: UInt32 = 1
    tst = t7
    Assert.isTrue(tst is Any)

    let t8: UInt16 = 1
    tst = t8
    Assert.isTrue(tst is Any)

    let t9: UInt8 = 1
    tst = t9
    Assert.isTrue(tst is Any)

    let t10: Float64 = .1
    tst = t10
    Assert.isTrue(tst is Any)

    let t11: Float32 = .1
    tst = t11
    Assert.isTrue(tst is Any)

    let t12: Float16 = .1
    tst = t12
    Assert.isTrue(tst is Any)

    let t13: Unit = ()
    tst = t13
    Assert.isTrue(tst is Any)

    let t14: Bool = true
    tst = t14
    Assert.isTrue(tst is Any)

    let t15: Rune = r'a'
    tst = t15
    Assert.isTrue(tst is Any)

    let t16: String = "fvafa"
    tst = t16
    Assert.isTrue(tst is Any)

    let t17: (Float32, Float32) = (.1, .1)
    tst = t17
    Assert.isTrue(tst is Any)

    let t18: () -> Int64 = { => 1}
    tst = t18
    Assert.isTrue(tst is Any)

    let t19: Range<Int64> = 1..10:1
    tst = t19
    Assert.isTrue(tst is Any)

    let t20: VArray<Bool, $2> = [true, false]
    tst = t20
    Assert.isTrue(tst is Any)

    let t21: Array<Rune> = [r'e', r'q', r'e']
    tst = t21
    Assert.isTrue(tst is Any)

    let t22: Option<String> = Option.Some("")
    tst = t22
    Assert.isTrue(tst is Any)
}