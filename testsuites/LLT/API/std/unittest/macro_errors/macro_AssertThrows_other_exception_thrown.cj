/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan Assert Failed: `(@AssertThrows(IllegalArgumentException))`
// ASSERT: scan expected types: IllegalArgumentException
// ASSERT: scan caught exception: IndexOutOfBoundsException
// ASSERT: scan Assert Failed: `(@AssertThrows(NoneValueException | IllegalArgumentException))`
// ASSERT: scan expected types: NoneValueException | IllegalArgumentException
// ASSERT: scan caught exception: Exception: abc
// ASSERT: scan Expect Failed: `(@ExpectThrows: Expected 'IllegalMemoryException | NoneValueException' was not caught.)`
// ASSERT: scan FAILED: 3

/*
 * This test checks output of failed tests.
 */

func throwIOB() {
    throw IndexOutOfBoundsException()
}

@Test
func other_excpetion_thrown() {
    @AssertThrows[IllegalArgumentException](throwIOB())
}

@Test
func other_exception_thrown_2() {
    @AssertThrows[NoneValueException | IllegalArgumentException](throw Exception("abc"))
}

@Test
func no_one_of_two_exceptions_thrown() {
    @ExpectThrows[IllegalMemoryException | NoneValueException](1)
}
