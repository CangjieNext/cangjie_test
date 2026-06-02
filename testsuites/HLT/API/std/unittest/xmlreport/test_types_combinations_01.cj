/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --reportFormat=xml --reportPath=./

/*
 * Test description:
 *      test types combination for a case
 * Test API:
 *      @Types[]
 */

import std.sync.*

@Test
class Test_Types_Combination_01 {
    var count = AtomicInt64(0)

    @TestCase
    @Types[T in<Int64, Float64, String>, U in<Int64, Float64, String>]
    func case01<T, U>(): Unit where T <: Hashable, U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
        count.fetchAdd(1)
    }

    @TestCase
    func case02(): Unit {
        @Expect(count.load(), 9)
    }
}

@Test
class Test_Types_Combination_02 {
    var count = AtomicInt64(0)

    @TestCase
    @Types[T in<Int64, Int64, Int64>, U in<Int64, Float64, String>]
    func case01<T, U>(): Unit where T <: Hashable, U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
        count.fetchAdd(1)
    }

    @TestCase
    func case02(): Unit {
        @Expect(count.load(), 9)
    }
}

@Test
class Test_Types_Combination_03 {
    var count = AtomicInt64(0)

    @TestCase
    @Types[T in<Int64, Int64, Int64>, U in<Int64, Float64, String>, 
 V in<Int64, Float64, String>, W in<Int64, Float64, String>]
    func case01<T, U, V, W>(): Unit where T <: Hashable, U <: Hashable, V <: Hashable, W <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<U>().size, 0)
        @Expect(Array<V>().size, 0)
        @Expect(Array<W>().size, 0)
        count.fetchAdd(1)
    }

    @TestCase
    func case02(): Unit {
        @Expect(count.load(), 81)
    }
}
