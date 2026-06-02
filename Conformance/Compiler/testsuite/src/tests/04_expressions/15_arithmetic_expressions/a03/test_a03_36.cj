
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a03_36

  @Level:         1

  @Assertion:   4.15(3)  The syntax of arithmetic expressions are defined as:
                prefixUnaryExpression
                    : prefixUnaryOperator* incAndDecExpression
                    ;
                prefixUnaryOperator
                    : '-'
                    | ...
                    ;
                additiveExpression
                    : multiplicativeExpression (additiveOperator multiplicativeExpression)*
                    ;
                multiplicativeExpression
                    : exponentExpression (multiplicativeOperator exponentExpression)*
                    ;
                exponentExpression
                    : prefixUnaryExpression (exponentOperator prefixUnaryExpression)*
                    ;
                additiveOperator
                    : '+' | '-'
                    ;
                multiplicativeOperator
                    : '*' | '/' | '%'
                    ;
                exponentOperator
                    : '**'
                    ;
  @Description: Checks that a - - b equals a - (-b) for a and b of various types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random


main() {
    Assert.equals(1i8 - (-1i8), 1i8 - - 1i8)
    Assert.equals(1i16 - (-1i16), 1i16 - - 1i16)
    Assert.equals(1i32 - (-1i32), 1i32 - - 1i32)
    Assert.equals(1i64 - (-1i64), 1i64 - - 1i64)
    Assert.approxEquals(1.0f16 - (-1.0f16), 1.0f16 - - 1.0f16)
    Assert.approxEquals(1.0f32 - (-1.0f32), 1.0f32 - - 1.0f32)
    Assert.approxEquals(1.0f64 - (-1.0f64), 1.0f64 - - 1.0f64)

    var xi8 : Int8
    var yi8 : Int8
    var xi16 : Int16
    var yi16 : Int16
    var xi32 : Int32
    var yi32 : Int32
    var xi64 : Int64
    var yi64 : Int64
    var xf16 : Float16
    var yf16 : Float16
    var xf32 : Float32
    var yf32 : Float32
    var xf64 : Float64
    var yf64 : Float64

    let rnd = Random(123)
    for (i in 0..2**10) {
        xi8 = rnd.nextInt8() / 2
        yi8 = rnd.nextInt8() / 2
        Assert.equals(xi8 - (-1i8), xi8 - - 1i8)
        Assert.equals(1i8 - (-yi8), 1i8 - - yi8)
        Assert.equals(xi8 - (-yi8), xi8 - - yi8)

        xi16 = rnd.nextInt16() / 2
        yi16 = rnd.nextInt16() / 2
        Assert.equals(xi16 - (-1i16), xi16 - - 1i16)
        Assert.equals(1i16 - (-yi16), 1i16 - - yi16)
        Assert.equals(xi16 - (-yi16), xi16 - - yi16)

        xi32 = rnd.nextInt32() / 2
        yi32 = rnd.nextInt32() / 2
        Assert.equals(xi32 - (-1i32), xi32 - - 1i32)
        Assert.equals(1i32 - (-yi32), 1i32 - - yi32)
        Assert.equals(xi32 - (-yi32), xi32 - - yi32)

        xi64 = rnd.nextInt64() / 2
        yi64 = rnd.nextInt64() / 2
        Assert.equals(xi64 - (-1i64), xi64 - - 1i64)
        Assert.equals(1i64 - (-yi64), 1i64 - - yi64)
        Assert.equals(xi64 - (-yi64), xi64 - - yi64)

        xf16 = rnd.nextFloat16()
        yf16 = rnd.nextFloat16()
        Assert.approxEquals(xf16 - (-1.0f16), xf16 - - 1.0f16)
        Assert.approxEquals(1.0f16 - (-yf16), 1.0f16 - - yf16)
        Assert.approxEquals(xf16 - (-yf16), xf16 - - yf16)

        xf32 = rnd.nextFloat32()
        yf32 = rnd.nextFloat32()
        Assert.approxEquals(xf32 - (-1.0f32), xf32 - - 1.0f32)
        Assert.approxEquals(1.0f32 - (-yf32), 1.0f32 - - yf32)
        Assert.approxEquals(xf32 - (-yf32), xf32 - - yf32)

        xf64 = rnd.nextFloat64()
        yf64 = rnd.nextFloat64()
        Assert.approxEquals(xf64 - (-1.0f64), xf64 - - 1.0f64)
        Assert.approxEquals(1.0f64 - (-yf64), 1.0f64 - - yf64)
        Assert.approxEquals(xf64 - (-yf64), xf64 - - yf64)
    }
}
