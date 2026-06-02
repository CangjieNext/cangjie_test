/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a04_01

  @Level:         1

  @Assertion: 9.5.1.1(4) The other case is for types except class and interface tyes, which are called class-irrelated 
              types.

  @Description: Check class-irrelated types.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct Point2D {
    Point2D(var x!: Float64, var y!: Float64) {}
}

enum ExpectedString {
    | Data(String)
    | Code(Int64)
}

// Upper bound is a struct, which is neither class nor interface.
class GenericClass1<T>  {
    init(arg: T) {
        x = arg
    }

    var x: T
}

// Upper bound is an enum, which is neither class nor interface.
class GenericClass2<T>  {
    init(arg: T) {
        x = arg
    }

    var x: T
}

// Upper bound is an integral, which is neither class nor interface.
class GenericClass3<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

main() {
    Assert.isTrue(GenericClass1<Point2D>(Point2D(x: 3.0, y: 4.0)).x is Point2D)
    Assert.isTrue(GenericClass3<Int64>(42).x is Int64)

    let value = match (GenericClass2<ExpectedString>(ExpectedString.Data("hello")).x) {
        case Data(x) => 1
        case Code(x) => 2
    }
    Assert.equals(1, value)
}

