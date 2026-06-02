/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

@Test
class TypeConvTest {
    @TestCase
    func test() {
        let a: Int32 = 64
        @PowerAssert(Int8(Int64(Int8(Int64(a)))), Int8(0i32))
    }

    /* SCAN-IN
    Assert Failed: `(Int8(Int64(Int8(Int64(a)))) == Int8(0i32))`
                    |    |     |    |     |_|||||  |__________|
                    |    |     |    |      64||||        0
                    |    |     |    |________||||
                    |    |     |        64    |||
                    |    |     |______________|||
                    |    |            64       ||
                    |    |_____________________||
                    |               64          |
                    |___________________________|
                                  64
     */
}
