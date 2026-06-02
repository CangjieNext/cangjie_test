/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a04_01

  @Level:         1

  @Assertion: 6.2.2.1(4)
              interface MyInterface {
                func f1(a!: Int64): Unit // OK
                func f2(a!: Int64 = 1): Unit // Error, cannot have parameter default values
              }

  @Description: Check that the positive case from the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface MyInterface {
    func f1(a!: Int64): Unit // OK
}

class A <: MyInterface {
    public func f1(a!: Int64) {
        Assert.equals(11, a)
    }
}

main() {
    A().f1(a: 11)
}