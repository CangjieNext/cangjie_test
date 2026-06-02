/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

@Test
class T {

    @TestCase
    func notEq(): Unit {
        @Expect(1.01f16 != 1.014f16, delta: 0.01f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}1.01f16 != 1.014f16, delta: 0.01f16{/COLOR})`
*/

    @TestCase
    func eq(): Unit {
        @Expect(1.1f16 == 1.2f16, delta: 0.001f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}1.1f16 == 1.2f16, delta: 0.001f16{/COLOR})`
*/

    @TestCase
    func greater(): Unit {
        @Expect(1.11f16 > 1.1f16, delta: 0.1f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}1.11f16 > 1.1f16, delta: 0.1f16{/COLOR})`
*/

    @TestCase
    func greaterOrEqual(): Unit {
        @Expect(0.1f16 >= 1.1f16, delta: 0.1f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}0.1f16 >= 1.1f16, delta: 0.1f16{/COLOR})`
*/

    @TestCase
    func less(): Unit {
        @Expect(1.1f16 < 1.11f16, delta: 0.1f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}1.1f16 < 1.11f16, delta: 0.1f16{/COLOR})`
*/

    @TestCase
    func lessOrEqual(): Unit {
        @Expect(1.3f16 <= 1.1f16, delta: 0.1f16)
    }

/* SCAN-IN
Expect Failed: `({COLOR=YELLOW}1.3f16 <= 1.1f16, delta: 0.1f16{/COLOR})`
*/

}
