/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

@Test
class Test_isAsciiControl {
    @TestCase
    func test_isAsciiControl_true(): Unit {
        for (i in 0..=31) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiControl(), true)
        }

        var byte: Byte = UInt8(127)
        @Expect(byte.isAsciiControl(), true)
    }

    @TestCase[i in [ 32, 128, 255 ] 
]
    func test_isAsciiControl_false(i: Int64): Unit {
        var byte: Byte = UInt8(i)
        @Expect(byte.isAsciiControl(), false)
    }
}
