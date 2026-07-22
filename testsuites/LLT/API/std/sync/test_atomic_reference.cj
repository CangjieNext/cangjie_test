/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

class BoxedInt {
    var val: Int64
    public init(v: Int64) {
        val = v
    }
    public operator func ==(other: BoxedInt): Bool {
        val == other.val
    }
}

@Test
public class AtomicReferenceTest {
    @TestCase
    func test_init_load(): Unit {
        let v = BoxedInt(42)
        let atomic = AtomicReference<BoxedInt>(v)
        @Expect(atomic.load().val == 42)
    }

    @TestCase
    func test_store(): Unit {
        let atomic = AtomicReference<BoxedInt>(BoxedInt(10))
        atomic.store(BoxedInt(20))
        @Expect(atomic.load().val == 20)
    }

    @TestCase
    func test_swap(): Unit {
        let atomic = AtomicReference<BoxedInt>(BoxedInt(10))
        let old = atomic.swap(BoxedInt(30))
        @Expect(old.val == 10)
        @Expect(atomic.load().val == 30)
    }

    @TestCase
    func test_cas_success(): Unit {
        let oldVal = BoxedInt(10)
        let atomic = AtomicReference<BoxedInt>(oldVal)
        let result = atomic.compareAndSwap(oldVal, BoxedInt(20))
        @Expect(result)
        @Expect(atomic.load().val == 20)
    }

    @TestCase
    func test_cas_fail(): Unit {
        let oldVal = BoxedInt(10)
        let atomic = AtomicReference<BoxedInt>(oldVal)
        let wrongOld = BoxedInt(99)
        let result = atomic.compareAndSwap(wrongOld, BoxedInt(20))
        @Expect(!result)
        @Expect(atomic.load().val == 10)
    }
}
