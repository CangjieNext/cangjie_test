/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows)RUN-EXEC: %export PWDPATH=`pwd` && %run %run_opt %output %run_args 
// (Windows and not OHOS)RUN-EXEC: %export "PWDPATH=%cd%" && %run %run_opt %output %run_utest_opt %run_args 
import std.posix.*
import std.process.*

@Test
class Test_PWD {
    @TestCase
    func test_PWD(): Unit {
        var pwdPath = Process.current.getEnv("PWDPATH")
        println(getcwd())
        println(pwdPath)
        @Expect(getcwd(), pwdPath)
        Process.current.removeEnv("PWDPATH")
    }
}
