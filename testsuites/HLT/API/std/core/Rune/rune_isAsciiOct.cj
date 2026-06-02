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
    @TestCase[rune in [ r'0', r'7' ] 
]
    func test_isAsciiOct_true(rune: Rune): Unit {
        @Expect(rune.isAsciiOct(), true)
    }

    @TestCase[rune in [ r'8', r'!', r'a', r'\0' ] 
]
    func test_isAsciiOct_false(rune: Rune): Unit {
        @Expect(rune.isAsciiOct(), false)
    }
}
