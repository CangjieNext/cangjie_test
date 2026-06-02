/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*

@When[backend == "cjnative"]
@Test
public class ThreadInfoTest {
    @TestCase
    func initThreadInfo(): Unit {
        let _ = ThreadInfo()
        @Expect(ThreadInfo.threadCount, 1)
        @Expect(ThreadInfo.blockingThreadCount, 0)
        @Expect(ThreadInfo.nativeThreadCount, 1)

        @Expect(getThreadCount(), 1)
        @Expect(getBlockingThreadCount(), 0)
        @Expect(getNativeThreadCount(), 1)
    }
}
