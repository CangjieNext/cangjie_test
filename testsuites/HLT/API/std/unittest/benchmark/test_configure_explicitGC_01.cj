/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench

/*
 * Test description:
 *      test if ExplicitGC parameter works in @Configure
 * Test API:
 *      @Configure
 *      public enum ExplicitGcType
 */

import std.time.*
import std.sync.*

@Test
@Configure[batchSize: 10, minDuration: 3 * Duration.second, minBatches: 5]
class Test_Configure_ExplicitGC {
    var count = AtomicInt64(0)

    public override func afterAll(): Unit {
        println(count.load())
    }
    // default: Light
    @Bench
    func case01(): Unit {
        var arr = Array<Rune>(4 * 1024 * 1024, repeat: r'a')
        unsafe {
            var cStr = LibC.mallocCString(String(arr))
            LibC.free(cStr)
        }
    }

    // Heavy
    @Bench
    @Configure[explicitGC: Heavy]
    func case02(): Unit {
        var arr = Array<Rune>(4 * 1024 * 1024, repeat: r'a')
        unsafe {
            var cStr = LibC.mallocCString(String(arr))
            LibC.free(cStr)
        }
    }

    // Disabled
    @Bench
    @Configure[explicitGC: Disabled]
    func case03(): Unit {
        var arr = Array<Rune>(4 * 1024 * 1024, repeat: r'a')
        unsafe {
            var cStr = LibC.mallocCString(String(arr))
            LibC.free(cStr)
        }
        count.fetchAdd(1)
    }
}
