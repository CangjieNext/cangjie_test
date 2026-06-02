/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: echo_environment.sh
// (not MAC and not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not MAC and not Windows) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not MAC and not Windows) ASSERT: scan set_environment_success!
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
        let p = Process.start("bash", "echo_environment.sh")
        let e = p.environment
        @Expect(e["temp_key"], "set_environment_success!")
        Process.current.removeEnv("temp_key")
    }

    @TestCase
    func test_default(): Unit {
        Process.current.setEnv("temp_key", "temp_value")
        let p = Process.start("sleep", "5s")
        let e = p.environment
        @Expect(e["temp_key"], "temp_value")
        Process.current.removeEnv("temp_key")
    }

    @TestCase
    func test_none(): Unit {
        Process.current.setEnv("temp_key", "temp_value")
        let p = Process.start("sleep", "5s", environment: None)
        let e = p.environment
        @Expect(e["temp_key"], "temp_value")
        Process.current.removeEnv("temp_key")
    }

    @TestCase
    func test_value_with_equal(): Unit {
        let env = HashMap<String, String>([("key1", "=value"), ("key2", "va=lue"), ("key3", "value=")])
        let p = Process.start("sleep", "5s", environment: env)
        let e = p.environment
        @Expect(e["key1"], "=value")
        @Expect(e["key2"], "va=lue")
        @Expect(e["key3"], "value=")
        Process.current.removeEnv("key1")
        Process.current.removeEnv("key2")
        Process.current.removeEnv("key3")
    }

    @TestCase
    func test_value_with_special_symbol(): Unit {
        let env = HashMap<String, String>(
            [
                ("123!@#一二三abc", "123!@#一二三abc"),
                ("!@#123一二三abc", "!@#123一二三abc"),
                ("一二三123!@#abc", "一二三123!@#abc"),
                ("abc一二三123!@#", "abc一二三123!@#"),
                ("(,/),$、%、{}, []", "(,/),$、%、{}, []")
            ]
        )
        let p = Process.start("sleep", "5s", environment: env)
        let e = p.environment
        @Expect(e["123!@#一二三abc"], "123!@#一二三abc")
        @Expect(e["!@#123一二三abc"], "!@#123一二三abc")
        @Expect(e["一二三123!@#abc"], "一二三123!@#abc")
        @Expect(e["abc一二三123!@#"], "abc一二三123!@#")
        @Expect(e["(,/),$、%、{}, []"], "(,/),$、%、{}, []")
        Process.current.removeEnv("123!@#一二三abc")
        Process.current.removeEnv("!@#123一二三abc")
        Process.current.removeEnv("一二三123!@#abc")
        Process.current.removeEnv("abc一二三123!@#")
        Process.current.removeEnv("(,/),$、%、{}, []")
    }

    @TestCase
    func test_long_environment(): Unit {
        var key = "key" * 1024 * 10
        let env = HashMap<String, String>([(key, "value")])
        let p = Process.start("sleep", "5s", environment: env)
        let e = p.environment
        @Expect(e[key], "value")
        Process.current.removeEnv(key)
    }

    @TestCase
    func test_value_with_blank(): Unit {
        let env = HashMap<String, String>([("key", "val ue")])
        let p = Process.start("sleep", "5s", environment: env)
        let e = p.environment
        @Expect(e["key"], "val ue")
        Process.current.removeEnv("key")
    }

    @TestCase
    func test_key_with_blank(): Unit {
        let env = HashMap<String, String>([("ke y", "val ue")])
        let p = Process.start("sleep", "5s", environment: env)
        let e = p.environment
        @Expect(e["ke y"], "val ue")
        Process.current.removeEnv("ke y")
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
    func test_key_with_empty(): Unit {
        let env = HashMap<String, String>([("", "value")])
        let p = Process.start("sleep", "5s", environment: env)
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
