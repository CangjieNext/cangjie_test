/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

@Test
class TestMemberNonRepeatable {
    @TestCase[x in 0 .. 100 
]
    func case3(x: Int64): Unit {
    }

    @Skip
    @TestCase
    @Skip
    func skip() {}

    @Bench
    @Bench
    func bench() {}

    @TestCase
    @TestCase
    func testCase() {}

    @Types[T in<String>]
    @TestCase
    @Types[T in<String>]
    func typeS<T>() {}
}

// ASSERT: scan-1 @Skip macro is not repeatable.
// ASSERT: scan-1 @Bench macro is not repeatable.
// ASSERT: scan-1 @TestCase macro is not repeatable.
// ASSERT: scan-1 @Types macro is not repeatable.
