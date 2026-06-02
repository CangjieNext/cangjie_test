/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan [ PASSED ] CASE: testFoo<Int64>
// ASSERT: scan [ PASSED ] CASE: testFoo<String>
// ASSERT: scan [ PASSED ] CASE: testFoo<Float64>

@Test
class FooTest {
    @Types[T in<Int64, String, Float64>]
    @TestCase
    func testFoo<T>(): Unit where T <: Equatable<T> {
        @Expect(Array<T>() == Array<T>())
    }
}
