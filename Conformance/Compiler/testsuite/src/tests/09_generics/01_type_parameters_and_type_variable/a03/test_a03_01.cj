/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a03_01

  @Level:         1

  @Assertion: 9.1(3) Once type parameters are declared, they can be used as a type.

  @Description: Check type parameter usage as type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class GenericClass<T> {
    init(arg: T) {
        x = arg
    }

    func ensureInt64() {
        Assert.isTrue(x is Int64)
    }

    var x: T
}

func ensureBool<T>(x: T) {
    Assert.isTrue(x is Bool)
}

main() {
    GenericClass<Int64>(42).ensureInt64()

    ensureBool(true)
}

