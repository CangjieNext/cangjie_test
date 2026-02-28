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
// (not Windows) ASSERT: scan-2 hello, cangjie

import std.env.*
import std.runtime.*
import std.posix.*

let sig_nums: Array<Int32> = [
    1,
    2,
    3,
    5,
    10,
    12,
    14,
    15,
    16,
    17,
    18,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
    // 4, 6, 7, 8, 9, 11, 13, 19 // not support now
]
let sig_excludes: Array<Int32> = [
    1,
    2,
    3,
    5,
    10,
    12,
    14,
    15,
    16,
    17,
    18,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29
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
    }
    resetSignalHandler(sig_excludes.map {i => Signal(i, "${i}")})
    sleep(Duration.second)
    for (signal in sig_nums.removePrefix(sig_excludes)) {
        spawn {
            sendSignal(signal)
        }
    }
    sleep(Duration.second * 3)
    resetSignalHandler()
    return 0
}
