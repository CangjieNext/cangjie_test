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

let signal: Int32 = 1
let count = Box<Int64>(0)

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

func func_2(_: Int32) {
    if (count.value != 1000) {
        throw Exception()
    }
    return true
}

// 验证注册函数执行次数上限
main() {
    resetSignalHandler()
    registerSignalHandler(
        Signal(signal, "1_${signal}"),
        {
            _: Int32 =>
                count.value++;
                false
        }
    )
    registerSignalHandler(Signal(signal, "2_${signal}"), func_2)
    sendSignal(signal)
    resetSignalHandler()
    return 0
}
