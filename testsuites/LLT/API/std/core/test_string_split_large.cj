/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class StringSplitLargeTest {
    @TestCase
    func testSplitLargeString(): Unit {
        let sb = StringBuilder()
        for (i in 0..1000) {
            sb.append("a,")
        }
        sb.append("b")
        let largeString = sb.toString()
        let parts = largeString.split(",")
        @Expect(parts.size, 1001)
    }
    
    @TestCase
    func testSplitSmallString(): Unit {
        let str = "a,b,c,d,e"
        let parts = str.split(",")
        @Expect(parts.size, 5)
    }
    
    @TestCase
    func testSplitNoMatch(): Unit {
        let str = "abcdefgh"
        let parts = str.split(",")
        @Expect(parts.size, 1)
        @Expect(parts[0], "abcdefgh")
    }
    
    @TestCase
    func testSplitAllMatch(): Unit {
        let str = ",,,,"
        let parts = str.split(",")
        @Expect(parts.size, 5)
    }
}
