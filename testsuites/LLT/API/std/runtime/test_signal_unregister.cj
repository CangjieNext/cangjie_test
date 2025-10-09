/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// (not Windows) EXEC: %set_stdx_path %run %run_opt %n.%suffix | compare %f 

// ASSERT: scan 0

import std.runtime.*
import std.env.*
import std.collection.*
import stdx.net.http.*

foreign func CJ_MCC_SignalKill(pid: Int32, sig: Int32): Unit
foreign func CJ_MCC_SignalRaise(sig: Int32): Unit

func unRegisterSignalHandler_mulSignal(): Unit {
    let result = ArrayList<String>()
    resetSignalHandler()
    let sig1 = Signal.SIGINT
    let sig2 = Signal.SIGQUIT
    let f1 = {
        i: Int32 =>
            result.add("f1")
            return true
    }
    let f2 = {
        i: Int32 =>
            result.add("f2")
            return true
    }

    registerSignalHandler(sig1, f1)
    registerSignalHandler(sig2, f2)
    resetSignalHandler(sig1)

    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig1.value) }
    sleep(Duration.second * 2)
    println(result.size)

}

main() {
    unRegisterSignalHandler_mulSignal()
}