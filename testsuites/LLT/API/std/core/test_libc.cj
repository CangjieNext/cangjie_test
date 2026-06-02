/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output %run_args

@Test
public class TestMalloc {
    @TestCase
    func test_overflow() {
        var overflow = false
        try {
            let c = LibC.malloc<Int64>(count: Int64.Max)
            @Assert(c.isNull())
        } catch (_: OverflowException) {
            overflow = true
        }

        @Assert(!overflow)
    }
}
