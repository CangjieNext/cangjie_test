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
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_env_branch {
    @TestCase
    func case_setVariable_key_null(): Unit {
        try {
            setVariable("a\0b", "c")
            @Expect(false)
        } catch (_: IllegalArgumentException) {}
    }

    @TestCase
    func case_setVariable_value_null(): Unit {
        try {
            setVariable("cj_env_branch_key", "c\0d")
            @Expect(false)
        } catch (_: IllegalArgumentException) {}
    }

    @TestCase
    func case_removeVariable_null(): Unit {
        try {
            removeVariable("a\0b")
            @Expect(false)
        } catch (_: IllegalArgumentException) {}
    }

    @TestCase
    func case_getVariable_null_in_key(): Unit {
        try {
            getVariable("x\0y")
            @Expect(false)
        } catch (_: IllegalArgumentException) {}
    }

    @TestCase
    func case_tempDirectory_from_tmpdir(): Unit {
        let key = "TMPDIR"
        let old = getVariable(key)
        try {
            setVariable(key, "/tmp/cj_env_branch_tmpdir")
            @Expect(getTempDirectory().toString(), "/tmp/cj_env_branch_tmpdir")
        } finally {
            restoreEnv(old, key: key)
        }
    }

    @TestCase
    func case_tempDirectory_fallback(): Unit {
        let keys = ["TMPDIR", "TMP", "TEMP", "TEMPDIR"]
        var saved = ArrayList<?String>()
        for (k in keys) {
            saved.add(getVariable(k))
            if (getVariable(k).isSome()) {
                removeVariable(k)
            }
        }
        try {
            @Expect(getTempDirectory().toString(), "/tmp")
        } finally {
            for (i in 0..keys.size) {
                restoreEnv(saved[i], key: keys[i])
            }
        }
    }

    @TestCase
    func case_console_write_empty_and_bool(): Unit {
        let out = getStdOut()
        out.write("")
        out.write(true)
        out.write(false)
        out.writeln(true)
        out.writeln(false)
        out.flush()
        let err = getStdErr()
        err.write("")
        err.write(true)
        err.write(false)
        err.writeln(true)
        err.writeln(false)
        err.flush()
        let _ = getStdIn()
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
