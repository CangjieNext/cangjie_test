/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a05_01

  @Level:         1

  @Assertion:       2.1.10.5(5) Using StructName<Type1, Type2, ..., TypeK>(labelValue1, labelValue2, ..., labelValueN)
                    for defining instances of generic structs. The only difference from defining an instance of a
                    non-generic struct is that type variables need to be instanced for generic struct, i.e., `Type1` to
                    `TypeN` should be given.

  @Description:     Check that it's possible to create a generic struct instance using the above-mentioned notation.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.{assert.Assert, macros.*}

type Type1 = Int64
type Type2 = Int64
type Type3 = Int64
type Type4 = Int64

struct StructName<T1, T2, T3, T4> {
    let v: T1
    let pair: (T2, T3)
    var array: Array<T4>

    init(arg1: T1, arg2: T2, arg3: T3) {
        v = arg1
        pair = (arg2, arg3)
        array = []
    }
    init(arg1: T1, arg2: T2, arg3: T3, arg4: T4) {
        v = arg1
        pair = (arg2, arg3)
        array = [arg4]
    }

    func getInnerData() {
        (v, pair, array)
    }
}

main() {
    let labelValue1: Type1 = 0
    let labelValue2: Type1 = 1
    let labelValue3: Type1 = 2
    match(StructName<Type1, Type2, Type3, Type4>(labelValue1, labelValue2, labelValue3).getInnerData()) {
        case (0, (1, 2), x) => Assert.equals([], x)
        case _ => Assert.fail()
    }

    let s = StructName<Int64, Int32, Int16, Int64>(-1, -2, -3, -4)
    Assert.equals(-1, s.v)
    @matchOrThrow[(-2, -3)](s.pair)
    Assert.equals([-4], s.array)
}
