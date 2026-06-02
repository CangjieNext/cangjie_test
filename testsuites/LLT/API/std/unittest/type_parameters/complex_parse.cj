/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan TCS: Foo<Int64>
// ASSERT: scan TCS: Foo<HashMap<String, Float64>>
// ASSERT: scan TCS: Bar<Int64>
// ASSERT: scan TCS: Bar<() -> String>
// ASSERT: scan TCS: Kuux<Int64>
// ASSERT: scan TCS: Kuux<(HashMap<String, Float64>) -> String>
// ASSERT: scan TCS: Quix<Int64>
// ASSERT: scan TCS: Quix<(String)>

import std.collection.HashMap

@Test
@Types[T in<Int64, HashMap<String, Float64>>]
class Foo<T> {
    @TestCase
    func fooTest(): Unit {
        @Assert(true)
    }
}

@Test
@Types[T in<Int64, () -> String> 
]
class Bar<T> {
    @TestCase
    func fooTest(): Unit {
        @Assert(true)
    }
}

@Test
@Types[T in<Int64, (HashMap<String, Float64>) -> String>]
class Kuux<T> {
    @TestCase
    func fooTest(): Unit {
        @Assert(true)
    }
}

@Test
@Types[T in<Int64, (String)>]
class Quix<T> {
    @TestCase
    func fooTest(): Unit {
        @Assert(true)
    }
}
