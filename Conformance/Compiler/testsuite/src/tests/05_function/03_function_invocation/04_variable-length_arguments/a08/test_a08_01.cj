/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a08_01

  @Level:         1

  @Assertion:       5.3.4(8) 5.The number of variable-length arguments can be 0 or more.

  @Description:     Check that the number of variable-length arguments can be 0 or more.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
}

struct myStruct {
    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
}

enum myEnum {

    S

    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
}

func f0(arr: Array<Int64>): Int64 { return arr.size }
func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }

main() {
    Assert.equals(3, f0([1,2,3]))
    Assert.equals(3, f0(1,2,3))
    Assert.equals(2, f0(1,2))
    Assert.equals(1, f0(1))
    Assert.equals(0, f0())

    Assert.equals(6, f1(3, [1,2,3]))
    Assert.equals(6, f1(3, 1,2,3))
    Assert.equals(5, f1(3, 1,2))
    Assert.equals(4, f1(3, 1))
    Assert.equals(3, f1(3))

    var myClassImpl = myClass()
    Assert.equals(3, myClassImpl.f0([1,2,3]))
    Assert.equals(3, myClassImpl.f0(1,2,3))
    Assert.equals(2, myClassImpl.f0(1,2))
    Assert.equals(1, myClassImpl.f0(1))
    Assert.equals(0, myClassImpl.f0())

    Assert.equals(6, myClassImpl.f1(3, [1,2,3]))
    Assert.equals(6, myClassImpl.f1(3, 1,2,3))
    Assert.equals(5, myClassImpl.f1(3, 1,2))
    Assert.equals(4, myClassImpl.f1(3, 1))
    Assert.equals(3, myClassImpl.f1(3))

    var myStructImpl = myStruct()
    Assert.equals(3, myStructImpl.f0([1,2,3]))
    Assert.equals(3, myStructImpl.f0(1,2,3))
    Assert.equals(2, myStructImpl.f0(1,2))
    Assert.equals(1, myStructImpl.f0(1))
    Assert.equals(0, myStructImpl.f0())

    Assert.equals(6, myStructImpl.f1(3, [1,2,3]))
    Assert.equals(6, myStructImpl.f1(3, 1,2,3))
    Assert.equals(5, myStructImpl.f1(3, 1,2))
    Assert.equals(4, myStructImpl.f1(3, 1))
    Assert.equals(3, myStructImpl.f1(3))

    Assert.equals(3, myEnum.S.f0([1,2,3]))
    Assert.equals(3, myEnum.S.f0(1,2,3))
    Assert.equals(2, myEnum.S.f0(1,2))
    Assert.equals(1, myEnum.S.f0(1))
    Assert.equals(0, myEnum.S.f0())

    Assert.equals(6, myEnum.S.f1(3, [1,2,3]))
    Assert.equals(6, myEnum.S.f1(3, 1,2,3))
    Assert.equals(5, myEnum.S.f1(3, 1,2))
    Assert.equals(4, myEnum.S.f1(3, 1))
    Assert.equals(3, myEnum.S.f1(3))

}
