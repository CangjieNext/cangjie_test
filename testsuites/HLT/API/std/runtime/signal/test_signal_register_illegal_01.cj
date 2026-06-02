/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.env.*
import std.runtime.*
import std.posix.*

let sig_nums: Array<Int32> = [
    4,
    6,
    7,
    8,
    9,
    11,
    13,
    19 // not support now
]

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

main() {
    for (signal in sig_nums) {
        let func_1 = {
            i: Int32 =>
                println("hello, cangjie${i}");
                true
        }
        registerSignalHandler(Signal(signal, "${signal}"), func_1)
        unregisterSignalHandler(Signal(signal, "${signal}"), func_1)
    }
    resetSignalHandler(sig_nums.map {i => Signal(i, "${i}")})
    return 0
}
