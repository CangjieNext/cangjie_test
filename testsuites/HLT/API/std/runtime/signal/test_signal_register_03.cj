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
// (not Windows) ASSERT: scan-1 hello, cangjie1
// (not Windows) ASSERT: scan-1 hello, cangjie2

import std.env.*
import std.runtime.*
import std.posix.*

let sig_nums: Array<Int32> = [
    1,
    2
]

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

// 验证注册函数的重复调用：函数地址相同
main() {
    for (signal in sig_nums) {
        resetSignalHandler()
        let func_1 = {
            i: Int32 =>
                println("hello, cangjie${i}");
                false
        }
        registerSignalHandler(Signal(signal, "${signal}"), func_1)
        registerSignalHandler(Signal(signal, "${signal}"), func_1)
        registerSignalHandler(Signal(signal, "${signal}"), func_1)
        registerSignalHandler(Signal(signal, "${signal}"), {_: Int32 => true})
        sendSignal(signal)
    }
    resetSignalHandler(sig_nums.map {i => Signal(i, "${i}")})
    return 0
}
