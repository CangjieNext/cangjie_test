/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan CASE: foo<Int64>
// ASSERT: scan CASE: foo<HashMap<String, Float64>>
// ASSERT: scan CASE: bar<Int64>
// ASSERT: scan CASE: bar<() -> String>
// ASSERT: scan CASE: kuux<Int64>
// ASSERT: scan CASE: kuux<(HashMap<String, Float64>) -> String>
// ASSERT: scan CASE: quix<Int64>
// ASSERT: scan CASE: quix<(String)>

import std.collection.HashMap

@Test
class Test1 {
    @TestCase
    @Types[T in<Int64, HashMap<String, Float64>>]
    func foo<T>(): Unit {
        @Assert(true)
    }

    @TestCase
    @Types[T in<Int64, () -> String>]
    func bar<T>(): Unit {
        @Assert(true)
    }

    @TestCase
    @Types[T in<Int64, (HashMap<String, Float64>) -> String>]
    func kuux<T>(): Unit {
        @Assert(true)
    }

    @TestCase
    @Types[T in<Int64, (String)>]
    func quix<T>(): Unit {
        @Assert(true)
    }
}
