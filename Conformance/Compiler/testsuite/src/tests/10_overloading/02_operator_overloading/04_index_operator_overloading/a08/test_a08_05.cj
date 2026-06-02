/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a08_05

  @Level:         1

  @Assertion: 10.2.4(8)
              The expression on the right side of = corresponds to the named parameter overloaded by the operator,
              there is one and only one named parameter, the name of the named parameter must be value, there can
              be no default value, and value can be of any type.

  @Description: Check that set form index operator can get any type as named parameter.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C<T> <: Equal<C<T>> & NotEqual<C<T>> where T <: Equal<T> {
    init(inX: T) {
        x = inX
    }

    operator func[](index: Int64, value!: T) {
        x = value
    }

    public operator func==(another: C<T>) {
        x == another.x
    }

    public operator func!=(another: C<T>) {
        !(x == another.x)
    }

    var x: T
}

func test<T>(initValue: T, assignValue: T) where T <: Equal<T> & NotEqual<T> {
    var c = C<T>(initValue)
    c[0] = assignValue
    Assert.isTrue(assignValue == c.x)
    Assert.isTrue(assignValue != initValue)
}

main() {
    test<Int64>(0, 5)
    test<Int32>(0, 5)
    test<Int16>(0, 5)
    test<UInt64>(0, 5)
    test<UInt32>(0, 5)
    test<UInt16>(0, 5)
    test<Float64>(0.0, 5.0)
    test<Float32>(0.0, 5.0)
    test<String>("hi", "hello")
    test<C<Int64>>(C<Int64>(0), C<Int64>(5))
}

