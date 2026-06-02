/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a15_01

  @Level:         1

  @Assertion:    2.3.1(15) The following shows example conversions between UInt16 and UInt32:
                    main() {
                        var u16Number: UInt16 = 65535
                        var u32Number: UInt32 = 0
                        u32Number = UInt32(u16Number) // ok: u32Number = 65535
                        u16Number = UInt16(u32Number) // ok: u16Number = 65535
                        u32Number = 65536
                        u16Number = UInt16(u32Number) // throw an ArithmeticException
                        return 0
                    }

  @Description:  Positive example check 

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main() {
    var u16Number: UInt16 = 65535
    var u32Number: UInt32 = 0
    u32Number = UInt32(u16Number) // ok: u32Number = 65535
    u16Number = UInt16(u32Number) // ok: u16Number = 65535

    Assert.equals(65535, u32Number)
    Assert.equals(65535, u16Number)

    return 0
}