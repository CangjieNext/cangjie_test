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
// (not Windows) ASSERT: scan-1 func_2_start_2_func_1_start_2_func_2_start_1_

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

func func_2(sig: Int32) {
    print("func_2_start_${sig}_")
    return false
}

// 验证注册函数被不同信号多次调用
main() {
    resetSignalHandler()
    registerSignalHandler(Signal(signal_1, "cj"), func_1)
    registerSignalHandler(Signal(signal_1, "cj"), func_2)
    registerSignalHandler(Signal(signal_2, "cj"), func_2)
    registerSignalHandler(Signal(signal_2, "cj"), func_1)
    registerSignalHandler(Signal(signal_1, "cj"), {_: Int32 => true})
    registerSignalHandler(Signal(signal_2, "cj"), {_: Int32 => true})
    spawn {
        unregisterSignalHandler(Signal(signal_1, "cj"), func_1)
    }
    sleep(Duration.second)
    sendSignal(signal_2)
    sendSignal(signal_1)
    resetSignalHandler()
    return 0
}
