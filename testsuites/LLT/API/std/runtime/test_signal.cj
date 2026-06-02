/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// (not Windows) EXEC: %set_stdx_path %run %run_opt %n.%suffix | compare %f

// ASSERT: scan Signal value must > 0 and < 32
// ASSERT: scan handle signal: 2
// ASSERT: scan handle signal: 13
// ASSERT: scan handle signal: 6
// ASSERT: scan handle signal: 4

// ASSERT: scan f2
// ASSERT: scan f2

// ASSERT: scan f3
// ASSERT: scan f4

// ASSERT: scan f5
// ASSERT: scan f6

// ASSERT: scan f8

import std.runtime.*
import std.env.*
import std.collection.*
import stdx.net.http.*


foreign func CJ_MCC_SignalKill(pid: Int32, sig: Int32): Unit
foreign func CJ_MCC_SignalRaise(sig: Int32): Unit

func registerSignalHandler_oneSignal(): Unit {
    resetSignalHandler()
    let sig = Signal.SIGINT
    let sigPipe = Signal(13, "SIGPIPE")
    let sigAbrt = Signal(6, "SIGABRT")
    let sigIll = Signal(4, "SIGILL")
    let f1 = {
        i: Int32 =>
            println("handle signal: ${i}")
            return true
    }
    registerSignalHandler(sig, f1)
    registerSignalHandler(sigPipe, f1)
    registerSignalHandler(sigAbrt, f1)
    registerSignalHandler(sigIll, f1)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }
    sleep(Duration.second * 3)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sigPipe.value) }
    sleep(Duration.second * 3)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sigAbrt.value) }
    sleep(Duration.second * 3)
    unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sigIll.value) }
    sleep(Duration.second * 3)
}


func registerSignalHandler_oneSignal_ex(): Unit {
    resetSignalHandler()
    let sig = Signal.SIGINT
    let f2 = {
        i: Int32 =>
            println("f2")
            return true
    }
    registerSignalHandler(sig, f2)
        unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }
    sleep(Duration.second * 3)
        unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }
    sleep(Duration.second * 3)
}

    func registerSignalHandler_mulSignal(): Unit {
        resetSignalHandler()
        let sig = Signal.SIGINT

        let f3 = {
            i: Int32 =>
                println("f3")
                return false
        }
        let f4 = {
            i: Int32 =>
                println("f4")
                return true
        }
        registerSignalHandler(sig, f3)
        registerSignalHandler(sig, f4)

        unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sig.value) }

        sleep(Duration.second * 3)
    }


    func registerSignalHandler_oneSig_mulFunc(): Unit {
        resetSignalHandler()
        let sigInt = Signal.SIGINT

        let f5 = {
            i: Int32 =>
                println("f5")
                return false
        }

        let f6 = {
            i: Int32 =>
                println("f6")
                return true
        }

        let f7 = {
            i: Int32 =>
                println("f7")
                return false
        }

        registerSignalHandler(sigInt, f5)
        registerSignalHandler(sigInt, f6)
        registerSignalHandler(sigInt, f7)

        unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sigInt.value) }
        sleep(Duration.second * 3)
    }

    func registerSignalHandler_sameFunc(): Unit {
        resetSignalHandler()
        let sigInt = Signal.SIGINT

        let f8: SignalHandlerFunc = {
            i: Int32 =>
                println("f8")
                return true
        }

        let f9 = f8
        let f10 = f8

        registerSignalHandler(sigInt, f8)
        registerSignalHandler(sigInt, f9)
        registerSignalHandler(sigInt, f10)
        unsafe { CJ_MCC_SignalKill(Int32(getProcessId()), sigInt.value) }
        sleep(Duration.second * 3)
    }
    func unRegisterSignalHandler_max(): Unit {
        resetSignalHandler()
        let sig = Signal(33, "sss")
        let f1 = {
            i: Int32 =>
                println("f1")
                return true
        }
        try {
            registerSignalHandler(sig, f1)
        } catch (e: Exception) {
            println(e.message)
        }
    }
main() {
        unRegisterSignalHandler_max()
        registerSignalHandler_oneSignal()
        registerSignalHandler_oneSignal_ex()
        registerSignalHandler_mulSignal()
        registerSignalHandler_oneSig_mulFunc()
        registerSignalHandler_sameFunc()
}