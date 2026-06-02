/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-0: %run %run_opt %output %run_utest_opt

import std.collection.*

@Test
@Types[T in<String, Rune, Int64>]
class HashSetTest<T> where T <: Hashable & Equatable<T> {
    @TestCase
    func testFoo(): Unit {
        @Expect(HashSet<T>().size, 0)
    }
}

// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
