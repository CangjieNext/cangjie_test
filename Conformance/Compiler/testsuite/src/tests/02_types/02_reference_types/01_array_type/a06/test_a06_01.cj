/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a06_01

  @Level:         1
  @Assertion:    2.2.1(6) Different types of Array are got when the type
                 variable T takes different values (i.e., types), e.g.,
                 Array<Int32> and Array<Float64> are array of Int32 and array
                 of Float64, respectively.

  @Description:  Checks that generic type T is correctly determined by both
                 value and generic parameter

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let a1: Array<Int32> = [1, 2, 3]
    a1[1] = 66
    Assert.isTrue(a1 is Array<Int32>)
    Assert.isTrue(a1[0] is Int32)

    let a2 = [1i32, 2i32, 3i32]
    a2[1] = 66i32
    Assert.isTrue(a2 is Array<Int32>)
    Assert.isTrue(a2[2] is Int32)

    let a3: Array<Float64> = [.1, .2, .3]
    a3[1] = .66
    Assert.isTrue(a3 is Array<Float64>)
    Assert.isTrue(a3[1] is Float64)

    let a4 = [.1f64, .2f64, .3f64]
    a4[1] = .66f64
    Assert.isTrue(a4 is Array<Float64>)
    Assert.isTrue(a4[2] is Float64)

    return 0
}
