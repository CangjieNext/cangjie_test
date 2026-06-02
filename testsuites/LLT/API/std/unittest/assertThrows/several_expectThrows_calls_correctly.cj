/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan Expect Failed: `(@ExpectThrows(IllegalArgumentException))`
// ASSERT: scan expected types: IllegalArgumentException
// ASSERT: scan caught exception: IndexOutOfBoundsException
// ASSERT: scan Expect Failed: `(@ExpectThrows(NoneValueException | IllegalArgumentException))`
// ASSERT: scan expected types: NoneValueException | IllegalArgumentException
// ASSERT: scan caught exception: Exception: abc

/*
 * This test checks output of failed tests.
 */

func throwIOB() {
    throw IndexOutOfBoundsException()
}

@Test
func several_exprect_throws_must_be_printed() {
    @ExpectThrows[IllegalArgumentException](throwIOB())
    @ExpectThrows[NoneValueException | IllegalArgumentException](throw Exception("abc"))
}
