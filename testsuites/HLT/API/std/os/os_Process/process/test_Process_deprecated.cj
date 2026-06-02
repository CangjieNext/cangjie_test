/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (not Windows) RUN-EXEC: %run %run_opt %output %run_args
// (not Windows) ASSERT: scan property 'current' is deprecated. CurrentProcess has been marked as deprecated, use related global functions in the std.env instead.
// (not Windows) ASSERT: scan function 'of' is deprecated. Use global function `public func findProcess(pid: Int64): Process` instead.
// (not Windows) ASSERT: scan function 'runOutput' is deprecated. Use global function `public func executeWithOutput(command: String, arguments: Array<String>, workingDirectory!: ?Path = None, environment!: ?Map<String, String> = None, stdIn!: ProcessRedirect = Inherit, stdOut!: ProcessRedirect = Pipe, stdErr!: ProcessRedirect = Pipe): (Int64, Array<Byte>, Array<Byte>)` instead.
// (not Windows) ASSERT: scan function 'start' is deprecated. Use global function `public func launch(command: String, arguments: Array<String>, workingDirectory!: ?Path = None, environment!: ?Map<String, String> = None, stdIn!: ProcessRedirect = Inherit, stdOut!: ProcessRedirect = Inherit, stdErr!: ProcessRedirect = Inherit): SubProcess` instead.
import std.process.*

main(): Unit {
    Process.current
    Process.of(1)
    try {
        Process.run("1", ["1"])
        Process.runOutput("1", ["1"])
        Process.start("1", ["1"])
    } catch (e: ProcessException) {
    }
}
