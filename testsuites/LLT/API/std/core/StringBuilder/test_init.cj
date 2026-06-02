/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

@Test
class InitTest {
    @TestCase
    func testInit(): Unit {
        let sb = StringBuilder()
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
        @Expect(sb.toString(), "")
    }

    @TestCase
    func testInitString(): Unit {
        var str = "1二叁④"
        var sb = StringBuilder(str)
        @Expect(sb.size, 10)
        @Expect(sb.capacity, 42)
        @Expect(sb.toString(), str)

        str = "x" * 33
        sb = StringBuilder(str)
        @Expect(sb.size, 33)
        @Expect(sb.capacity, 65)
        @Expect(sb.toString(), str)

        str = ""
        sb = StringBuilder(str)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
        @Expect(sb.toString(), str)
    }

    @TestCase
    func testInitRunes(): Unit {
        var sb = StringBuilder(r'x', 0)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
        @Expect(sb.toString(), "")

        sb = StringBuilder(r'x', 33)
        @Expect(sb.size, 33)
        @Expect(sb.capacity, 65)
        @Expect(sb.toString(), "x" * 33)

        try {
            StringBuilder(r'x', -1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of rune should not be negative.")
        }
    }

    @TestCase
    func testInitRuneArr(): Unit {
        let runeArr: Array<Rune> = [r'1', r'a', r'一']
        let sb = StringBuilder(runeArr)
        @Expect(sb.size, 5)
        @Expect(sb.capacity, 37)
        @Expect(sb.toString(), "1a一")

        let runeArr2 = Array<Rune>()
        let sb2 = StringBuilder(runeArr2)
        @Expect(sb2.size, 0)
        @Expect(sb2.capacity, 32)
        @Expect(sb2.toString(), "")
    }

    @TestCase
    func testInitCapacity(): Unit {
        var sb = StringBuilder(33)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 33)
        @Expect(sb.toString(), "")

        try {
            sb = StringBuilder(0)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The capacity should be positive.")
        }
    }
}
