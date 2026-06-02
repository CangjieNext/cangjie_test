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
class Test_isAsciiOct {
    @TestCase
    func test_isAsciiOct_true(): Unit {
        for (i in 48..=55) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiOct(), true)
        }
    }

    @TestCase
    func test_isAsciiOct_false(): Unit {
        for (i in 56..=255) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiOct(), false)
        }

        for (i in 0..=47) {
            var byte: Byte = UInt8(i)
            @Expect(byte.isAsciiOct(), false)
        }
    }
}
