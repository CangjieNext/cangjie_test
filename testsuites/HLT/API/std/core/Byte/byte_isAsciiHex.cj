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
class Test_isAsciiHex {
    @TestCase
    func test_isAsciiHex_true(): Unit {
        for (i in 48..=57) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), true)
        }

        for (i in 65..=70) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), true)
        }

        for (i in 97..=102) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), true)
        }
    }

    @TestCase
    func test_isAsciiHex_false(): Unit {
        for (i in 0..=47) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), false)
        }

        for (i in 58..=64) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), false)
        }

        for (i in 71..=96) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), false)
        }

        for (i in 103..=255) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiHex(), false)
        }
    }
}
