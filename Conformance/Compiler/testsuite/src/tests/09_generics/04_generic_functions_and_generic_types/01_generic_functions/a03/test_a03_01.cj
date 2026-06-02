/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a03_01

  @Level:         1

  @Assertion: 9.4.1(3) 
              func f<T>() {...}
              func f1<T1, T2, T3, ...>() {...}

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func f<T>(x: T) {
    return x
}

func f1<T1, T2, T3, T4>(x1: T1, x2: T2, x3: T3, x4: T4) {
    return (x1, x2, x3, x4)
}

main() {
    Assert.isTrue(f<String>("hello world") is String)
    Assert.isTrue(f1<Int32, Float32, Int64, Float64>(42, 35.0, 4, 5.0)[0] is Int32)
    Assert.isTrue(f1<Int32, Float32, Int64, Float64>(42, 35.0, 4, 5.0)[1] is Float32)
    Assert.isTrue(f1<Int32, Float32, Int64, Float64>(42, 35.0, 4, 5.0)[2] is Int64)
    Assert.isTrue(f1<Int32, Float32, Int64, Float64>(42, 35.0, 4, 5.0)[3] is Float64)
}

