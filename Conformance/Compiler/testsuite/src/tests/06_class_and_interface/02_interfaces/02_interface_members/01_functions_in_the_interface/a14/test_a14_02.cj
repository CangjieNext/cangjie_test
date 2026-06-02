/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a14_02

  @Level:         1

  @Assertion: 6.2.2.1(14)
              Functions modified with mut are a special kind of instance member function
              that can be used to abstract the mutable behavior of struct types.

  @Description: Check that classes an enums can have mut functions through interface implementation

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006358

  @Comment: This behaviour is unspecified. The test reflects the compiler implementation.
            Revisit this test once the issue 6358 is resolved

*/

import utils.assert.Assert

interface I {
    mut func f1() {
        return 1
    }

    mut func f2(x: Int64) {
        return 2
    }

    mut func f3() {
        return 3
    }

    mut func f4(x: Int64) {
        return 4
    }
}

class C <: I {}

enum E <: I {
    EC(Rune)
}

main() {
    var tst1 = C()
    Assert.equals(1, tst1.f1())
    Assert.equals(2, tst1.f2(0))
    Assert.equals(3, tst1.f3())
    Assert.equals(4, tst1.f4(0))

    var tst2 = E.EC(r'a')
    Assert.equals(1, tst2.f1())
    Assert.equals(2, tst2.f2(0))
    Assert.equals(3, tst2.f3())
    Assert.equals(4, tst2.f4(0))
}