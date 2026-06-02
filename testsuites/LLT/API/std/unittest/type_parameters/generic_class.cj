/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan TCS: FooTest<String, String>
// ASSERT: scan TCS: FooTest<String, Float64>
// ASSERT: scan TCS: FooTest<Rune, String>
// ASSERT: scan TCS: FooTest<Rune, Float64>
// ASSERT: scan TCS: FooTest<Int64, String>
// ASSERT: scan TCS: FooTest<Int64, Float64>

import std.collection.HashSet

@Test
@Types[A in<String, Rune, Int64>, B in<String, Float64>]
class FooTest<A, B> where A <: Hashable & Equatable<A>, B <: Hashable & Equatable<B> {
    @TestCase
    func testFoo(): Unit {
        @Expect(HashSet<A>().size, 0)
        @Expect(HashSet<B>().size, 0)
    }
}
