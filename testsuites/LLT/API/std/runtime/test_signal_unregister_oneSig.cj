/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// (not Windows) EXEC: %set_stdx_path %run %run_opt %n.%suffix | compare %f 


// ASSERT: scan f11
// ASSERT: scan f12
// ASSERT: scan f12


import std.runtime.*
import std.env.*
import std.collection.*
import stdx.net.http.*

foreign func CJ_MCC_SignalKill(pid: Int32, sig: Int32): Unit
foreign func CJ_MCC_SignalRaise(sig: Int32): Unit


func unRegisterSignalHandler_oneSignal(): Unit {
    resetSignalHandler()
    let sig = Signal.SIGINT
    let f11 = {
        i: Int32 =>
            println("f11")
            return false
    }
    let f12 = {
        i: Int32 =>
            println("f12")
            return true
    }
    registerSignalHandler(sig, f11)
    registerSignalHandler(sig, f12)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }
    sleep(Duration.second * 2)

    unregisterSignalHandler(sig, f11)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }
    sleep(Duration.second * 2)
}

main() {
    unRegisterSignalHandler_oneSignal()
}