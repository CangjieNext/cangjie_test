/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a02_01

  @Level:         1
  @Assertion:    2.2.1(2) Arrays are used to store a sequence of values of the
                 same type (or has a common super type).

  @Description:  Checks that Array of different types can be created

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../array_commons.cj

*/
import utils.assert.*
import array_commons.*

main(): Int64 {
    let a1: Array<Int32> = [1, 2, 3]
    a1[1] = 66
    Assert.isTrue(a1 is Array<Int32>)

    let a2: Array<Float64> = [.1, .2, .3]
    a2[1] = .66
    Assert.isTrue(a2 is Array<Float64>)

    let a3: Array<Bool> = [true, false]
    a3[0] = false
    Assert.isTrue(a3 is Array<Bool>)

    let a4 = Array<A>()
    Assert.isTrue(a4 is Array<A>)

    let a5: Array<I> = [C1(), C2(), C3()]
    Assert.isTrue(a5 is Array<I>)

    return 0
}
