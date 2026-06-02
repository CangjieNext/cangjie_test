/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class Foo {
    func get(x: Int64) {
        x.toString() + "pa"
    }
}

func id<T>(x: T) {
    x
}

@Frozen
func mock2<K>() {
    let a = id(mock<K>());
    a
}

@Frozen
public func spy2<K>(k: K) {
    spy<K>(k)
}

@Frozen
func mockFrozen1<K>() {
    let a = id(mock<K>());
    a
}

@Test
public class TestA {
    @Frozen
    func mockFrozen2<K>() {
        let a = id(mockFrozen1<K>());
        a
    }

    @TestCase
    func case1(): Unit {
        let m = mock<Foo>()
        @On(m.get(22)).returns("...1")
        @Assert(m.get(22), "...1")
    }

    @TestCase
    func case2(): Unit {
        let s = spy(Foo())
        @On(s.get(23)).returns("...2")
        @Assert(s.get(23), "...2")
    }

    @TestCase
    func case3(): Unit {
        let m = mock<Foo>()
        @On(m.get(24)).returns("...3")
        @Assert(m.get(24), "...3")
    }
}
