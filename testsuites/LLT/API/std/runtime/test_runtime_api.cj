/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


package std.runtime_test

import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class RuntimeApiTest {
    @TestCase
    func test_getMaxHeapSize(): Unit {
        let size = getMaxHeapSize()
        @Assert(size >= 0)
    }

    @TestCase
    func test_getAllocatedHeapSize(): Unit {
        let size = getAllocatedHeapSize()
        @Assert(size >= 0)
    }

    @TestCase
    func test_getUsedHeapSize(): Unit {
        let size = getUsedHeapSize()
        @Assert(size >= 0)
    }

    @TestCase
    func test_getUsedHeapSize_not_negative(): Unit {
        // getUsedHeapSize should return a non-negative value on a running process
        let size = getUsedHeapSize()
        @Assert(size >= 0)
    }

    @TestCase
    func test_getProcessorCount(): Unit {
        let count = getProcessorCount()
        @Assert(count > 0)
    }

    @TestCase
    func test_getMaxHeapSize_positive(): Unit {
        let size = getMaxHeapSize()
        @Assert(size > 0)
    }

    @TestCase
    func test_getAllocatedHeapSize_le_maxHeap(): Unit {
        let allocated = getAllocatedHeapSize()
        let max = getMaxHeapSize()
        @Assert(allocated <= max)
    }
}
