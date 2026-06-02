/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a24_01

  @Level:         1

  @Assertion:    2.3.1(24) POSITIVE_INFINITY or NEGTIVE_INFINITY is returned when the value exceeds the range of the
                 target type. Furthermore, the sign is determined based on the original value.

  @Description:  Check that POSITIVE_INFINITY or NEGTIVE_INFINITY is returned if the value is outside the range of
                 the target type

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

*/

import utils.assert.Assert

main(): Unit {
    Assert.isTrue(Float16(65536_i32).isInf())
    Assert.isTrue(Float16(-65520_i32).isInf())

    Assert.isTrue(4.4E38 == Float16(65536_i32))
    Assert.isTrue(-4.4E38 == Float16(-65520_i32))
    Assert.isFalse(4.4E38 == Float16(-65520_i32))

    Assert.isTrue(Float16(65536_i64).isInf())
    Assert.isTrue(Float16(-65520_i64).isInf())

    Assert.isTrue(4.4E38 == Float16(65536_i64))
    Assert.isTrue(-4.4E38 == Float16(-65520_i64))
    Assert.isFalse(4.4E38 == Float16(-65520_i64))

    Assert.isTrue(Float16(IntNative(65536)).isInf())
    Assert.isTrue(Float16(IntNative(-65520)).isInf())

    Assert.isTrue(4.4E38 == Float16(IntNative(65536)))
    Assert.isFalse(-4.4E38 == Float16(IntNative(65536)))
    Assert.isTrue(-4.4E38 == Float16(IntNative(-65520)))

    Assert.isTrue(Float32(999999999999999999999999999999999999999999.0).isInf())
    Assert.isTrue(Float32(-999999999999999999999999999999999999999999.0).isInf())

    Assert.isTrue(4.4E38 == Float32(999999999999999999999999999999999999999999.0))
    Assert.isFalse(-4.4E38 == Float32(999999999999999999999999999999999999999999.0))
    Assert.isTrue(-4.4E38 == Float32(-999999999999999999999999999999999999999999.0))
}