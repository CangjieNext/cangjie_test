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
// (not Windows) ASSERT: scan-7 hello, cangjie

import std.env.*
import std.runtime.*
import std.posix.*

let signals = [
    Signal.SIGHUP, // 0x1
    Signal.SIGINT, // 0x2
    Signal.SIGQUIT, // 0x3
    Signal.SIGTRAP, // 0x5
    Signal.SIGALRM, // 0xe
    Signal.SIGTERM // 0xf
]

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

main() {
    for (signal in signals) {
        let func_1 = {
            i: Int32 =>
                println("hello, cangjie${i}");
                true
        }
        registerSignalHandler(signal, func_1)
        sendSignal(signal.value)
        unregisterSignalHandler(signal, func_1)
    }
    registerSignalHandler(Signal.SIGHUP) {
        i: Int32 =>
            println("hello, cangjie${i}");
            true
    }
    sendSignal(1)
    return 0
}
