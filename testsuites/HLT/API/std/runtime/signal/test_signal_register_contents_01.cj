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
// (not Windows) ASSERT: scan-1 CJNatvie Handle signal: 1

import std.env.*
import std.runtime.*
import std.posix.*

let signal: Int32 = 1

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

func func_3(_: Int32) {
    return false
}

func func_1(_: Int32) {
    return false
}

// 验证注册函数的内容
main() {
    func func_2(_: Int32) {
        return true
    }

    let func_4 = {_: Int32 => false}

    resetSignalHandler()
    registerSignalHandler(Signal(signal, "${signal}"), func_4)
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_3)
    registerSignalHandler(Signal(signal, "${signal}"), func_2)
    sendSignal(signal)
    resetSignalHandler()
    return 0
}
