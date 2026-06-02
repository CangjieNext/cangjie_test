// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test {
    @TestCase
    func testPrimitives(): Unit {
        let inputBool = false
        let resBool = unsafe { PassToCBool(inputBool) }
        @Assert(resBool, true)

        let inputInt8: Int8 = 2
        let resInt8 = unsafe { PassToCInt8(inputInt8) }
        @Assert(resInt8, inputInt8 * 2)

        let inputUInt64: UInt64 = 16
        let resUInt64 = unsafe { PassToCUInt64(inputUInt64) }
        @Assert(resUInt64, inputUInt64 * 2)
    }
}
