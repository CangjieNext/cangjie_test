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

@Test
public class ProcessInfoTest {
    @TestCase
    func processorCountTest(): Unit {
        let a: Int64 = ProcessorInfo.processorCount
        @Expect(a > 0, true)
        let b: Int64 = getProcessorCount()
        @Expect(b > 0, true)
    }

    @TestCase
    func initProcessInfo(): Unit {
        let _ = ProcessorInfo()
    }
}
