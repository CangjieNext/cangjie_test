/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

@Test
public class Test_Example {
    @TestCase
    func test_AssertThrows(): Unit {
        var arr = [1, 2, 3]
        @AssertThrows[IndexOutOfBoundsException]({
            var arraySlice = arr.slice(0, 10)
        })
    }
}
