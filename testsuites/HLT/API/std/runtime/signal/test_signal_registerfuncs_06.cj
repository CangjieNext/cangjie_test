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
// (not Windows and not MAC) ASSERT: scan-23 hello, cangjie
// (MAC) ASSERT: scan-21 hello, cangjie

import std.env.*
import std.runtime.*
import std.posix.*

@When[os != "macOS"]
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

@When[os == "macOS"]
let sig_nums: Array<Int32> = [
    12,
    1,
    2,
    3,
    5,
    14,
    15,
    16,
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
    31,
    // 4, 6, 7, 8, 9, 10, 11, 13, 17, 19 // not support now
]

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

let func_1 = {
    i: Int32 =>
        println("hello, cangjie${i}");
        true
}

main() {
    for (signal in sig_nums) {
        registerSignalHandler(Signal(signal, "${signal}"), func_1)
        sendSignal(signal)
    }
    resetSignalHandler(sig_nums.map {i => Signal(i, "${i}")})
    return 0
}
