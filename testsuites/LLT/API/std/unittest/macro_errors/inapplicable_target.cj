/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

@Test
class Foo {
    @TestCase
    var c = 5

    @Bench
    prop x: String {
        get() {
            "v"
        }
    }

    @Parallel
    let j = 10
}

/* SCAN-IN
Test framework: macro failed to expand.
@TestCase macro can only be put on function.
@Bench macro can only be put on function.
@Parallel macro can only be put on class or function.
@Parallel macro must be used together with one of: @Test, @TestBuilder.
 */
