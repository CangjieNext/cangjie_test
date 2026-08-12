/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.collection.*
import std.env.*

/*
 * Branch-focused coverage for std.env env.cj:
 * process info APIs, variables roundtrip, temp dir branches, atExit registration.
 */
@Test
public class TestEnvCoverage {
    @TestCase
    func testProcessInfoApis(): Unit {
        @Expect(getProcessId() > 0, true)
        @Expect(getCommand().size > 0, true)
        @Expect(getWorkingDirectory().toString().size > 0, true)
        @Expect(getHomeDirectory().toString().size > 0, true)
        let cmdline = getCommandLine()
        @Expect(cmdline.size > 0, true)
    }

    @TestCase
    func testVariablesRoundtripAndGetVariables(): Unit {
        let key = "CJ_COV_ENV_TEST_KEY"
        let old = getVariable(key)
        try {
            setVariable(key, "alpha")
            @Expect(getVariable(key), Some("alpha"))
            setVariable(key, "beta")
            @Expect(getVariable(key), Some("beta"))
            removeVariable(key)
            @Expect(getVariable(key), None)

            let vars = getVariables()
            @Expect(vars.size > 0, true)
            var found = false
            for ((k, v) in vars) {
                if (k == "PATH") {
                    found = true
                    @Expect(v.size > 0, true)
                }
            }
            @Expect(found, true)
        } finally {
            restoreEnv(old, key: key)
        }
    }

    @TestCase
    func testTempDirectoryFromTmp(): Unit {
        let key = "TMP"
        let old = getVariable(key)
        try {
            setVariable(key, "/tmp/cj_cov_env_tmp")
            @Expect(getTempDirectory().toString(), "/tmp/cj_cov_env_tmp")
        } finally {
            restoreEnv(old, key: key)
        }
    }

    @TestCase
    func testAtExitRegistration(): Unit {
        atExit({ => ()})
        @Expect(true)
    }
}

func restoreEnv(old: ?String, key!: String): Unit {
    if (let Some(v) <- old) {
        setVariable(key, v)
        return
    }
    try {
        removeVariable(key)
    } catch (_: Exception) {
    }
}
