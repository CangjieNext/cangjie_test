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
// (not Windows) ASSERT: scan-1 func_1_start_1_

import std.env.*
import std.runtime.*
import std.posix.*

let signal: Int32 = 1

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
    registerSignalHandler(Signal(signal, "1_${signal}"), func_1)
    registerSignalHandler(Signal(signal, "2_${signal}"), func_1)
    registerSignalHandler(Signal(signal, "2_${signal}")) {_: Int32 => true}
    sendSignal(signal)
    resetSignalHandler()
    return 0
}
