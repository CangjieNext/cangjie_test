/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan Assert Failed
@Test
class Test_PowerAssert {
    @TestCase
    func test01() {
        let VALIDREGEXSTR = "abc\n\\n"
        @PowerAssert(VALIDREGEXSTR == ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"##)
    }
}
