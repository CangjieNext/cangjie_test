/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a05_01

  @Level:         1
  @Assertion:    2.2.1(5) Array is a reference type, defined as a variable of
                 reference type, the variable name is stored in the reference
                 to the data value, so in the assignment or function passing,
                 Array copies the reference.

  @Description:  Checks that array copied and passed to function by reference

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

class Cls {
    public var val: Int64 = 0

    init(val: Int64) {
        this.val = val
    }
}


main(): Int64 {
    let arr1 = Array<Cls>(10) { i => Cls(82 * (i + 1))}
    let c = Cls(8)
    arr1[0] = c

    c.val = 71
    Assert.equals(71, arr1[0].val)

    let arr2 = arr1
    arr1[2].val = 903
    Assert.equals(903, arr2[2].val)

    func arrTest(arr: Array<Cls>) {
        arr[5].val = 6

        Assert.equals(6, arr1[5].val)
        Assert.equals(6, arr2[5].val)
    }

    arrTest(arr2)

    Assert.equals(6, arr1[5].val)
    Assert.equals(6, arr2[5].val)

    return 0
}
