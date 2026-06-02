/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a13_01

  @Level:         1

  @Assertion:    2.3.1(13) The following shows example conversions between Int8 and Int16 using the strategy of
                 throwing exceptions:
                    main() {
                    var i8Number: Int8 = 127
                    var i16Number: Int16 = 0
                    i16Number = Int16(i8Number) // ok: i16Number = 127
                    i8Number = Int8(i16Number) // ok: i8Number = 127
                    i16Number = 128
                    i8Number = Int8(i16Number) // throw an ArithmeticException
                    return 0
                    }

  @Description:  Positive example check 

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main() {
    var i8Number: Int8 = 127
    var i16Number: Int16 = 0
    i16Number = Int16(i8Number) // ok: i16Number = 127
    i8Number = Int8(i16Number) // ok: i8Number = 127

    Assert.equals(127, i16Number)
    Assert.equals(127, i8Number)

    return 0
}