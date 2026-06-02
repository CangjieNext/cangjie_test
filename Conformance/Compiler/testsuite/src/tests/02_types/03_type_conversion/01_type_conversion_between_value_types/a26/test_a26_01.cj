/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a26_01

  @Level:         1

  @Assertion:    2.3.1(26) Furthermore, the conversion from floating-point to signed integer follows the
                 round-toward-zero mode, i.e. the fractional part is discarded

  @Description:  Check that the conversion from floating point to signed integer is performed in rounding mode to zero

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    Assert.equals(126,  Int8(126.7_f16))
    Assert.equals(-126, Int8(-126.9_f32))
    Assert.equals(126,  Int8(126.9_f64))

    Assert.equals(110,    Int16(110.9_f16))
    Assert.equals(0,      Int16(-0.9_f32))
    Assert.equals(30276,  Int16(30276.999_f64))

    Assert.equals(-156,      Int32(-156.2_f16))
    Assert.equals(-2144647,  Int32(-2144647.001_f32))
    Assert.equals(74836,     Int32(74836.5_f64))

    Assert.equals(5,                  Int64(5.93_f16))
    Assert.equals(-372036,            Int64(-372036.92_f32))
    Assert.equals(92233736854775600,  Int64(92233736854775605.5_f64))
}