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
class Test_rune_utf8_negative_index {
    @TestCase
    func test_fromUtf8_negative_index(): Unit {
        // Negative index should throw IllegalArgumentException instead of
        // out-of-bounds memory read (regression for issue #763).
        let arr: Array<UInt8> = [0xE4, 0xBD, 0xA0, 0x21]  // "你!"
        var caught = false
        try {
            let (_, _) = Rune.fromUtf8(arr, -1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught, true)
    }

    @TestCase
    func test_utf8Size_negative_index(): Unit {
        // Negative index should throw IllegalArgumentException.
        let arr: Array<UInt8> = [0xE4, 0xBD, 0xA0, 0x21]  // "你!"
        var caught = false
        try {
            let _ = Rune.utf8Size(arr, -1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught, true)
    }

    @TestCase
    func test_valid_index_no_regression(): Unit {
        // Valid index behavior must not regress.
        let arr: Array<UInt8> = [0xE4, 0xBD, 0xA0, 0x21]  // "你!"
        @Expect(Rune.utf8Size(arr, 0), 3)
        let (r, n) = Rune.fromUtf8(arr, 0)
        @Expect(n, 3)
        @Expect(UInt32(r), 0x4F60)
        @Expect(Rune.utf8Size(arr, 3), 1)
        let (r2, n2) = Rune.fromUtf8(arr, 3)
        @Expect(n2, 1)
        @Expect(UInt32(r2), 0x21)
    }
}
