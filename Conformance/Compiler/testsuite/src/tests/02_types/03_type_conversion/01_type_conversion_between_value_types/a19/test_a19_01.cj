/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a19_01

  @Level:         1

  @Assertion:    2.3.1(19) Otherwise, determine the overflow strategy based on the attributed macro used in the context
                 (the default strategy is throwing exceptions), see Arithmetic Expressions for details of the different
                 overflow strategies.

  @Description:  Check that if the value is outside the range of the target type, the conversion will 
                 throw an exception (@OverflowThrowing as default)

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    Assert.throws({ => UInt8([-8_i8][0]) },                       check: { e => e is OverflowException})
    Assert.throws({ => UInt8([8642_i16][0]) },                    check: { e => e is OverflowException})
    Assert.throws({ => UInt8([-3442523_i32][0]) },                check: { e => e is OverflowException})
    Assert.throws({ => UInt8([563483452_i64][0]) },               check: { e => e is OverflowException})
    Assert.throws({ => UInt8([IntNative(-37525)][0]) },           check: { e => e is OverflowException})
    
    Assert.throws({ => UInt16([-35_i8][0]) },                     check: { e => e is OverflowException})
    Assert.throws({ => UInt16([-32768_i16][0]) },                 check: { e => e is OverflowException})
    Assert.throws({ => UInt16([66000_i32][0]) },                  check: { e => e is OverflowException})
    Assert.throws({ => UInt16([362451334_i64][0]) },              check: { e => e is OverflowException})
    Assert.throws({ => UInt16([IntNative(-3762234)][0]) },        check: { e => e is OverflowException})

    Assert.throws({ => UInt32([-128_i8][0]) },                    check: { e => e is OverflowException})
    Assert.throws({ => UInt32([-1_i16][0]) },                     check: { e => e is OverflowException})
    Assert.throws({ => UInt32([-36245612_i32][0]) },              check: { e => e is OverflowException})
    Assert.throws({ => UInt32([3624561235323_i64][0]) },          check: { e => e is OverflowException})
    Assert.throws({ => UInt32([IntNative(-376225124523)][0]) },   check: { e => e is OverflowException})

    Assert.throws({ => UInt64([-12_i8][0]) },                     check: { e => e is OverflowException})
    Assert.throws({ => UInt64([-2000_i16][0]) },                  check: { e => e is OverflowException})
    Assert.throws({ => UInt64([-3624561_i32][0]) },               check: { e => e is OverflowException})
    Assert.throws({ => UInt64([-36245612353_i64][0]) },           check: { e => e is OverflowException})
    Assert.throws({ => UInt64([IntNative(-376225124523)][0]) },   check: { e => e is OverflowException})


    Assert.throws({ => Int8([128_u8][0]) },                       check: { e => e is OverflowException})
    Assert.throws({ => Int8([128_u16][0]) },                      check: { e => e is OverflowException})
    Assert.throws({ => Int8([128_u32][0]) },                      check: { e => e is OverflowException})
    Assert.throws({ => Int8([128_u64][0]) },                      check: { e => e is OverflowException})
    Assert.throws({ => Int8([UIntNative(128)][0]) },              check: { e => e is OverflowException})
    
    Assert.throws({ => Int16([32768_u16][0]) },                   check: { e => e is OverflowException})
    Assert.throws({ => Int16([32768_u32][0]) },                   check: { e => e is OverflowException})
    Assert.throws({ => Int16([32768_u64][0]) },                   check: { e => e is OverflowException})
    Assert.throws({ => Int16([UIntNative(32768)][0]) },           check: { e => e is OverflowException})

    Assert.throws({ => Int32([2147483648_u32][0]) },              check: { e => e is OverflowException})
    Assert.throws({ => Int32([2147483648_u64][0]) },              check: { e => e is OverflowException})
    Assert.throws({ => Int32([UIntNative(2147483648)][0]) },      check: { e => e is OverflowException})

    Assert.throws({ => Int64([9223372036854775808_u64][0]) },    check: { e => e is OverflowException})
}
