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
class Test_toAsciiLowerCase {
    @TestCase
    func test_toAsciiLowerCase_true(): Unit {
        for (i in 65..=90) {
            var byte: Byte = UInt8(i)
            @Expect(byte.toAsciiLowerCase(), UInt8(i) + 32)
        }
    }

    @TestCase[i in [ 0, 64, 91, 128, 255 ] 
]
    func test_toAsciiLowerCase_false(i: Int64): Unit {
        var byte: Byte = UInt8(i)
        @Expect(byte.toAsciiLowerCase(), UInt8(i))
    }
}
