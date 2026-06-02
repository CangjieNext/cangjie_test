
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a05_01

  @Level:         1

  @Assertion:   4.15(5) The value of -expr is equal to the value of the operand taking a negative value.
                The type of -expr is the type of expr.
  @Description: Checks for each variable (1) of different types that the result (2) of applying unary `-` is equal to
                the number, which is the opposite of (1)'s value. Also checks that types of (1) and (2) are the same.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var vI8 : Int8 = 12
    Assert.equals(-12, -vI8)
    Assert.isTrue(-vI8 is Int8)

    var vI16 : Int16 = -1234
    Assert.equals(1234, -vI16)
    Assert.isTrue(-vI16 is Int16)

    var vI32 : Int32 = 123456
    Assert.equals(-123456, -vI32)
    Assert.isTrue(-vI32 is Int32)

    var vI64 : Int64 = -12345654321
    Assert.equals(12345654321, -vI64)
    Assert.isTrue(-vI64 is Int64)

    var vIN : IntNative = 1
    Assert.equals(-1, -vIN)
    Assert.isTrue(-vIN is IntNative)

    var vF16 : Float16 = -1.0
    Assert.equals(1.0, -vF16)
    Assert.isTrue(-vF16 is Float16)

    var vF32 : Float32 = 123.456
    Assert.equals(-123.456, -vF32)
    Assert.isTrue(-vF32 is Float32)

    var vF64 : Float64 = -123456789.123456789
    Assert.equals(123456789.123456789, -vF64)
    Assert.isTrue(-vF64 is Float64)
}
