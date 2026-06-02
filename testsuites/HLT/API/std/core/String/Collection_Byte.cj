/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
@Test
class Test_Collection_byte {
    @TestCase
    func test_check_collection(): Unit {
        let runes = [r'1', r'a', r'一', r'に', r'!', r'\0', r'\n', r'\u{4f60}', r'\u{597d}']
        let str = String(runes)
        let bytes: Array<Byte> = [49, 97, 228, 184, 128, 227, 129, 171, 33, 0, 10, 228, 189, 160, 229, 165, 189]
        @Expect(str.toArray(),bytes)
        @Expect(str.size, 17)
    }

    @TestCase
    func test_check_iteator(): Unit {
        var cnt1 = 0
        var cnt2 = 0
        let runes = [r'1', r'a', r'一', r'に', r'!', r'\0', r'\n', r'\u{4f60}', r'\u{597d}']
        let str = String(runes)
        for (i in str.iterator()) {
            cnt1++
        }
        @Expect(cnt1, 17)

        for (i in str.runes()) {
            cnt2++
        }
        @Expect(cnt2, 9)
    }

    @TestCase
    func test_toRuneArray(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.toRuneArray(),[r'1', r'に', r'三', r'\u{1f64f}', r'\u{1f3ff}', r'\u{1f469}', r'\u{200d}', r'\u{1f469}', r'\u{200d}', r'\u{1f467}', r'\u{200d}', r'\u{1f466}'])
    }

    @TestCase
    func test_size_check(): Unit {
        let str = "0123456789"
        let sub = str[2..4]
        @Expect(sub, "23")
        try {
            var a = sub[-1]
            @Expect(1, 2)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "The length of the string is 2, but the index is -1.")
        }

        try {
            var a = sub[2]
            @Expect(1, 2)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "The length of the string is 2, but the index is 2.")
        }
    }
}
