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

@Test
public class CPUProfiling {
    @TestCase
    func test1(): Unit {
        startCPUProfiling()
        if (true) {
            let a = Array<String>(2000, repeat: "aaa")
            @Expect(a.size > 0, true)
        }
        gc()
        try {
            stopCPUProfiling(Path("./cpuinfo.txt"))
            remove("./cpuinfo.txt")
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to stop cpu profiling"))
        }
    }

    @TestCase
    func test2() {
        try {
            stopCPUProfiling(Path("./cpuinfo.txt"))
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to stop cpu profiling"))
        }
    }

    @TestCase
    func test3() {
        try {
            startCPUProfiling()
            startCPUProfiling()
        } catch (e: Exception) {
            @Expect(e.message.contains("Failed to start cpu profiling"))
        }
    }
}
