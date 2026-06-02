/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color
package std.unittest.tests

import std.unittest.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*
import std.sync.Semaphore
import std.process.*
import std.env.*
import std.collection.*

@When[os == "Windows"]
private const CMD: String = "cmd.exe"
@When[os != "Windows"]
private const CMD: String = "/bin/sh"

@When[os == "Windows"]
private func args(code: Int, stdout: Bool): Array<String> {
    // for some reason cmd.exe inside of cmd.exe only works with exit 
    // if the whole command is a single argument
    if (stdout) {
        ["/C echo child out & echo child err 1>&2 & exit ${code}"]
    } else {
        ["/C exit ${code}"]
    }
}

@When[os != "Windows"]
private func args(code: Int, stdout: Bool): Array<String> {
    // must be a single argument
    if (stdout) {
        ["-c", "echo \"child out\" && echo \"child err\" 1>&2 && exit ${code}"]
    } else {
        ["-c", "exit ${code}"]
    }
}

private func ctx(expectedCode!: Int = 0, captureOutput!: Bool = false) {
    let envs = HashMap<String, String>()
    envs.add(all: getVariables())
    let cmd = TestPackageExecuteCommand(
        CMD,
        args(expectedCode, captureOutput),
        envs
    )
    let reporterConfig = Configuration()
    reporterConfig.set(KeyCaptureOutput.captureOutput, captureOutput)
    MainExecutionCtx(1, Semaphore(1), TestOutputReporter.fromConfiguration(reporterConfig), cmd)
}

@Test[expectedCode in [ 1, 3, 11, 209 ]]
func exitCode(expectedCode: Int) {
    let child = processStart(ctx(expectedCode: expectedCode))
    sleep(Duration.millisecond * expectedCode * 6)
    let exitCode = child.wait()
    @Expect(exitCode, expectedCode)
}

@Test
func capture() {
    let child = processStart(ctx(captureOutput: true))
    @Expect(0, child.wait())

    @Expect(String.fromUtf8(child.stdout()).trimAscii(), "child out")
    @Expect(String.fromUtf8(child.stderr()).trimAscii(), "child err")
}
