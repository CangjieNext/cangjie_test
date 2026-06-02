/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a01_01

  @Level:         1

  @Assertion: 9.3.5(1) For a constraint L <: T<A1..An>, the declaration T of its upper bound T<T1..Tn> may declared 
              other constraints.

  @Description: Check derived constraint construction.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert


interface IL1_1<T> {
    func method_1_1(x: T): Int64
}

interface IL1_2<T> {
    func method_1_2(x: T): Int64
}

interface IL2<T1, T2> where T1 <: IL1_1<T1>, T2 <: IL1_2<T2> {
    func method_2(x: T1, y: T2): Int64
}

class Impl <: IL1_1<Impl> & IL1_2<Impl> & IL2<Impl, Impl> {
    public func method_1_1(x: Impl): Int64 {
        return 11
    }

    public func method_1_2(x: Impl): Int64 {
        return 12
    }

    public func method_2(x: Impl, y: Impl): Int64 {
        return x.method_1_1(x) + y.method_1_2(y)
    }
}

func foo<T>(x: T) where T <: IL2<T, T> {
    return x.method_2(x, x)
}

main() {
    var x = Impl()
    Assert.equals(23, foo<Impl>(x))
}

