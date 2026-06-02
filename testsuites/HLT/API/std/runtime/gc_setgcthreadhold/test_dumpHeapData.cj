/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.fs.*

main() {
    var a: Int64 = MemoryInfo.maxHeapSize
    var b: Int64 = MemoryInfo.allocatedHeapSize
    var c: Int64 = MemoryInfo.heapPhysicalMemory
    var UsedHeapSize = getUsedHeapSize()
    return 0
}

@Test
public class TestDumpHeapData {
    @TestCase
    func testMemoryInfo(): Unit {
        @Expect(MemoryInfo.maxHeapSize > 0, true)
        @Expect(MemoryInfo.allocatedHeapSize > 0, true)
        @Expect(MemoryInfo.heapPhysicalMemory > 0, true)
        @Expect(getUsedHeapSize() > 0, true)
    }

    @TestCase
    func testDumpHeapData(): Unit {
        var str = unsafe { LibC.mallocCString("hello world") }
        var tmp = str.subCString(0, 5)
        try {
            dumpHeapData(Path("./cpuinfo.txt"))
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to dump heap data"))
        }
        unsafe { LibC.free(str) }
        unsafe { LibC.free(tmp) }
    }
}
