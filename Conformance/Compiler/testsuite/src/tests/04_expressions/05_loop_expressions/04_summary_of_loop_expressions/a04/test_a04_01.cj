/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a04_01

  @Level:         1

  @Assertion: 4.5.4(4) Note that the type of the three loop expressions is Unit.
  @Description: Check that type of loop expressions is Unit
  @Mode: run
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

main() {
    var count = 0

    func f1(): Unit {
        for (i in 1..3) { count++ }
    }
    func f2(): Unit {
        while (count < 5) { count++ }
    }
    func f3(): Unit {
        do { count++ } while (count < 10)
    }
    func f4(): Unit {
        while (let _ <- count) { break }
    }

    f1()
    f2()
    f3()
    f4()

    Assert.equals(10, count)

    let v1 = for (i in 1..3) { break }
    Assert.isTrue(v1 == ())

    let v2 = while (true) { break }
    Assert.isTrue(v2 == ())

    let v3 = do { break } while (true)
    Assert.isTrue(v3 == ())

    let v4 = while (let _ <- count) { break }
    Assert.isTrue(v4 == ())
}
