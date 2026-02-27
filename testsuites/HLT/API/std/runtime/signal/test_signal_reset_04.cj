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
// (not Windows) ASSERT: scan-1 func_1_start_1_func_3_start_1_func_2_start_1_

import std.env.*
import std.runtime.*
import std.posix.*

let signal: Int32 = 1

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

func func_3(sig: Int32) {
    print("func_3_start_${sig}_")
    return false
}

func func_1(sig: Int32) {
    print("func_1_start_${sig}_")
    return false
}

// 验证注册函数的重置
main() {
    func func_2(sig: Int32) {
        print("func_2_start_${sig}_")
        return true
    }

    let func_4 = {
        i: Int32 =>
            print("func_4_start_${i}_");
            false
    }

    registerSignalHandler(Signal(signal, "${signal}"), func_4)
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_3)
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_4)
    registerSignalHandler(Signal(signal, "${signal}"), func_2)
    resetSignalHandler([Signal(signal, "${signal}")])
    registerSignalHandler(Signal(signal, "${signal}"), func_4)
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_3)
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_4)
    unregisterSignalHandler(Signal(signal, "${signal}"), func_4)
    registerSignalHandler(Signal(signal, "${signal}"), func_2)
    sendSignal(signal)
    resetSignalHandler([Signal(signal, "${signal}")])
    return 0
}
