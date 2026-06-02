/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: echo_environment.sh
// (not iOS and not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not Windows) ASSERT: scan set_environment_success!
import std.collection.*
import std.posix.*
import std.process.*
import std.math.*

@Test
class Test_environment {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_check_func_of_environment(): Unit {
        Process.current.setEnv("temp_key", "set_environment_success!")
        let p = Process.start("sh", "echo_environment.sh")
        try {
            let e = p.environment
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Can not get process environment.")
        }
        Process.current.removeEnv("temp_key")
    }

    @TestCase
    func test_key_with_null(): Unit {
        let env = HashMap<String, String>([("\0", "value")])
        try {
            let p = Process.start("sleep", "5s", environment: env)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Environment \"\0\" entry cannot contains invalid character.")
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func test_key_with_equal(): Unit {
        let env1 = HashMap<String, String>([("key=", "value")])
        try {
            let p = Process.start("sleep", "5s", environment: env1)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Environment \"key=\" entry cannot contains invalid character.")
        }
        @Expect(cnt, 1)

        let env2 = HashMap<String, String>([("=key", "value")])
        try {
            let p = Process.start("sleep", "5s", environment: env2)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Environment \"=key\" entry cannot contains invalid character.")
        }
        @Expect(cnt, 2)

        let env3 = HashMap<String, String>([("ke=y", "value")])
        try {
            let p = Process.start("sleep", "5s", environment: env3)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Environment \"ke=y\" entry cannot contains invalid character.")
        }
        @Expect(cnt, 3)
    }
}
