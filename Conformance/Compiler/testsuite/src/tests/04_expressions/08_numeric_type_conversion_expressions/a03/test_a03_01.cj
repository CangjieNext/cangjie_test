/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_08_a03_01

  @Level:         1

  @Assertion: 4.8(3)
              The syntax of numeric type conversion expressions are defined as:

              numericTypeConvExpr
                  : numericTypes '(' expression ')'
                  ;

              numericTypes
                  : 'Int8'
                  | 'Int16'
                  | 'Int32'
                  | 'Int64'
                  | 'UInt8'
                  | 'UInt16'
                  | 'UInt32'
                  | 'UInt64'
                  | 'Float16'
                  | 'Float32'
                  | 'Float64'
                  ;

  @Description: Check conversion expression patterns.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let x: Int64 = 5
    let x32: Int32 = 5

    Assert.equals(5, Int8(x))
    Assert.equals(5, Int16(x))
    Assert.equals(5, Int32(x))
    Assert.equals(5, Int64(x32))
    Assert.equals(5, UInt8(x))
    Assert.equals(5, UInt16(x))
    Assert.equals(5, UInt32(x))
    Assert.equals(5, UInt64(x))
    Assert.equals(5.0, Float16(x))
    Assert.equals(5.0, Float32(x))
    Assert.equals(5.0, Float64(x))

    Assert.isTrue(Int8(x) is Int8)
    Assert.isTrue(Int16(x) is Int16)
    Assert.isTrue(Int32(x) is Int32)
    Assert.isTrue(Int64(x32) is Int64)
    Assert.isTrue(UInt8(x) is UInt8)
    Assert.isTrue(UInt16(x) is UInt16)
    Assert.isTrue(UInt32(x) is UInt32)
    Assert.isTrue(UInt64(x) is UInt64)
    Assert.isTrue(Float16(x) is Float16)
    Assert.isTrue(Float32(x) is Float32)
    Assert.isTrue(Float64(x) is Float64)
}

