/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows)RUN-EXEC: export HOSTNAME=`hostname` && %run %run_opt %output %run_utest_opt %run_args 
import std.posix.*
import std.process.*

@Test
class Test_getHostName {
    @TestCase
    func test_getHostName(): Unit {
        var hostName = Process.current.getEnv("HOSTNAME")
        @Expect(gethostname(), hostName)
        Process.current.removeEnv("HOSTNAME")
    }
}
