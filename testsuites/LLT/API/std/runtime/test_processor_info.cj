/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

internal import std.runtime.*
import std.fs.*
import std.env.*

@Test
public class ProcessInfoTest {
    @TestCase
    func processorCountTest(): Unit {
        let a: Int64 = ProcessorInfo.processorCount
        @Expect(a > 0, true)
        let b: Int64 = getProcessorCount()
        @Expect(b > 0, true)
        @Expect(a, b)
    }

    @TestCase
    func initProcessInfo(): Unit {
        let _ = ProcessorInfo()
    }
}

@When[backend == "cjnative" && os != "Windows"]
@Test
public class CPUProfilingTest {
    @TestCase
    func startAndStopCPUProfiling(): Unit {
        let path = Path("/tmp/cj_cpu_prof_${getProcessId()}.txt")
        startCPUProfiling()
        var sum = 0
        for (i in 0..10000) {
            sum += i
        }
        blackBox(sum)
        stopCPUProfiling(path)
        @Expect(exists(path))
        remove(path)
    }
}
