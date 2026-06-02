/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a15_02

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

  @Description:  Check exception in example 

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main() {
    Assert.throws({ =>     
        var u16Number: UInt16 = 65535
        var u32Number: UInt32 = 0
        u32Number = UInt32(u16Number) // ok: u32Number = 65535
        u16Number = UInt16(u32Number) // ok: u16Number = 65535
        u32Number = 65536
        var a15_02_01 = [u32Number]
        u16Number = UInt16(a15_02_01[0]) // throw an ArithmeticException
    }, check: { e => e is ArithmeticException})
    return 0
}