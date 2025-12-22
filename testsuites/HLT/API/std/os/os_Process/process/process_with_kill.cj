/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS and not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.fs.*
import std.posix.*
import std.process.*
import std.math.*

@When[os != "macOS"]
let b: String = "5s"
@When[os == "macOS"]
let b: String = "5"

@Test
class test_with_kill {
    @TestCase
    func test_process(): Unit {
        var cnt = 0
        let subprocess = Process.start("sleep", b)
        let process = Process.of(subprocess.pid)
        kill(Int32(subprocess.pid), SIGKILL)
        let returncode = subprocess.wait()
        @Expect(returncode, 9)
        try {
            process.terminate()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Process pid \"${process.pid}\" not exist, not allow kill process.")
        }
        @Expect(cnt, 1)
    }
}
