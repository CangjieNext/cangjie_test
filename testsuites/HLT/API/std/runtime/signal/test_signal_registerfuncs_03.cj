/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not Windows) ASSERT: scan-1 func_1_start_1_func_1_start_2_

import std.env.*
import std.runtime.*
import std.posix.*

let signal_1: Int32 = 1
let signal_2: Int32 = 2

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

func func_1(sig: Int32) {
    print("func_1_start_${sig}_")
    return false
}

// 验证注册函数被不同信号多次调用
main() {
    resetSignalHandler()
    registerSignalHandler(Signal(signal_1, "1_${signal_1}"), func_1)
    registerSignalHandler(Signal(signal_2, "2_${signal_2}"), func_1)
    registerSignalHandler(Signal(signal_1, "1_${signal_1}")) {_: Int32 => true}
    registerSignalHandler(Signal(signal_2, "2_${signal_2}")) {_: Int32 => true}
    sendSignal(signal_1)
    sendSignal(signal_2)
    resetSignalHandler()
    return 0
}
