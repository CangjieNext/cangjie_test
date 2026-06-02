/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a01_01

  @Level:         1

  @Assertion:       5.3.4(1) Variable-length arguments are a special kind of function call syntactic sugar. When the 
                    last non-named parameter is of Arraytype, the corresponding position in the arguments can be 
                    passed directly using a sequence of arguments instead of an Arrayliteral.

  @Description:     Check that if the last non-named parameter is of Arraytype, the corresponding position in the 
                    arguments can be passed directly using a sequence of arguments instead of an Arrayliteral.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

struct myStruct {
    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

enum myEnum {

    S

    func f0(arr: Array<Int64>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

func f0(arr: Array<Int64>): Int64 { return arr.size }
func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }


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

    Assert.equals(28, f2(3, [1,2,3], b: 22))
    Assert.equals(19, f2(3, 1,2,3, b:13))
    Assert.equals(-2, f2(3, 1,2, b: -7))
    Assert.equals(9, f2(3, 1, b: 5))
    Assert.equals(3, f2(3, b: 0))

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

    Assert.equals(28, myClassImpl.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myClassImpl.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myClassImpl.f2(3, 1,2, b: -7))
    Assert.equals(9, myClassImpl.f2(3, 1, b: 5))
    Assert.equals(3, myClassImpl.f2(3, b: 0))

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

    Assert.equals(28, myStructImpl.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myStructImpl.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myStructImpl.f2(3, 1,2, b: -7))
    Assert.equals(9, myStructImpl.f2(3, 1, b: 5))
    Assert.equals(3, myStructImpl.f2(3, b: 0))

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

    Assert.equals(28, myEnum.S.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myEnum.S.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myEnum.S.f2(3, 1,2, b: -7))
    Assert.equals(9, myEnum.S.f2(3, 1, b: 5))
    Assert.equals(3, myEnum.S.f2(3, b: 0))

}
