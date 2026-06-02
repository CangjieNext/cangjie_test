/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC and not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not MAC and not Windows) RUN-EXEC: export OSNAME=`cat /proc/version` && %run %run_opt %output %run_utest_opt %run_args
import std.posix.*
import std.process.*

@Test
class Test_getOS {
    @TestCase
    func test_getOS(): Unit {
        var osName = Process.current.getEnv("OSNAME")
        @Expect(getos().contains(osName.getOrThrow()))
        Process.current.removeEnv("OSNAME")
    }
}
