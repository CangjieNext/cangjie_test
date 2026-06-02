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
class Test_creat {
    @TestCase
    func test_isAsciiPunctuation_true(): Unit {
        for (i in 33..=47) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiPunctuation(), true)
        }
        for (i in 58..=64) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiPunctuation(), true)
        }
        for (i in 91..=96) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiPunctuation(), true)
        }
        for (i in 123..=126) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiPunctuation(), true)
        }
    }

    @TestCase[i in [ 0, 32, 48, 57, 65, 90, 97, 122, 127 ] 
]
    func test_isAsciiPunctuation_false(i: Int64): Unit {
        var byte: Byte = UInt8(i)
        @Expect(byte.isAsciiPunctuation(), false)
    }
}
