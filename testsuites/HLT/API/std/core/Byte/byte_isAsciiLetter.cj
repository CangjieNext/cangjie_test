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
class Test_isAsciiLetter {
    @TestCase
    func test_isAsciiLetter_true(): Unit {
        for (i in 65..=90) {
            var byte = UInt8(i)
            @Expect(byte.isAsciiLetter(), true)
        }

        for (i in 97..=122) {
            var byte = UInt8(i)
            @Expect(byte.isAsciiLetter(), true)
        }
    }

    @TestCase[i in [ 0, 64, 91, 96, 123, 255 ] 
]
    func test_isAsciiLetter_false(i: Int64): Unit {
        var byte: Byte = UInt8(i)
        @Expect(byte.isAsciiLetter(), false)
    }
}
