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
class ReserveTest {
    @TestCase
    func testReserve(): Unit {
        let str = "x" * 70
        var sb = StringBuilder(r'x', 70)
        sb.reserve(10)
        @Expect(sb.size, 70)
        @Expect(sb.capacity, 102)
        @Expect(sb.toString(), str)

        sb = StringBuilder(str)
        sb.reserve(50)
        @Expect(sb.size, 70)
        @Expect(sb.capacity, 153)
        @Expect(sb.toString(), str)

        sb = StringBuilder(100)
        sb.append(str)
        sb.reserve(100)
        @Expect(sb.size, 70)
        @Expect(sb.capacity, 170)
        @Expect(sb.toString(), str)

        sb = StringBuilder()
        sb.reserve(10)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
        @Expect(sb.toString(), "")

        sb.reserve(0)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)

        sb.reserve(-1)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
    }
}
