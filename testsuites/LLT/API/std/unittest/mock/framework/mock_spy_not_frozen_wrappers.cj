/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output --mock=off %cmp_utest_opt 2>&1 | compare %f

import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class Foo {}

func id<T>(x: T) {
    x
}

func mock2<K>() {
    let a = id(mock<K>());
    a
}

func spy2<K>(k: K) {
    spy<K>(k)
}

@Frozen
func mockFrozen<K>() {
    let a = id(mock<K>());
    a
}

func mockNotFrozen<K>() {
    let a = id(mockFrozen<K>());
    a
}

public class TestA {
    func case1(): Unit {
        mock2<Foo>()
    }

    func case2(): Unit {
        spy2(Foo())
    }

    func case3(): Unit {
        mockNotFrozen<Foo>()
    }
}

main() {
    0
}

/* SCAN-IN
error: generic wrapper function 'mock2' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> mock_spy_not_frozen_wrappers.cj:19:1:
   | 
19 |   func mock2<K>() {
   |  _^
20 | |     let a = id(mock<K>());
   | | ...
22 | | }
   | |_^
   | 

error: generic wrapper function 'spy2' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> mock_spy_not_frozen_wrappers.cj:24:1:
   | 
24 |   func spy2<K>(k: K) {
   |  _^
25 | |     spy<K>(k)
26 | | }
   | |_^
   | 

error: generic wrapper function 'mockNotFrozen' for createMock/createSpy calls should be marked with @Frozen annotation
  ==> mock_spy_not_frozen_wrappers.cj:34:1:
   | 
34 |   func mockNotFrozen<K>() {
   |  _^
35 | |     let a = id(mockFrozen<K>());
   | | ...
37 | | }
   | |_^
   | 
*/
