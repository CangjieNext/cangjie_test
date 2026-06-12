/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// (not Windows) EXEC: %set_stdx_path %run %run_opt %n.%suffix | compare %f

// ASSERT: scan Signal handler concurrent test passed
// ASSERT: scan No deadlock detected

import std.runtime.*
import std.env.*
import std.sync.*
import std.collection.*
import stdx.net.http.*
import std.time.*

foreign func CJ_MCC_SignalKill(pid: Int32, sig: Int32): Unit

let concurrentSignalCount = AtomicInt32(0)
let handlerEnteredCount = AtomicInt32(0)
let handlerCompletedCount = AtomicInt32(0)

func testConcurrentSignalHandling(): Unit {
    resetSignalHandler()
    
    let sig = Signal.SIGINT
    
    let handler = {
        i: Int32 =>
            handlerEnteredCount.fetchAdd(1)
            sleep(Duration.millisecond * 100)
            handlerCompletedCount.fetchAdd(1)
            return true
    }
    
    registerSignalHandler(sig, handler)
    
    let pid = Int32(getProcessId())
    
    spawn {
        sleep(Duration.millisecond * 10)
        unsafe { CJ_MCC_SignalKill(pid, sig.value) }
        concurrentSignalCount.fetchAdd(1)
    }
    
    spawn {
        sleep(Duration.millisecond * 20)
        unsafe { CJ_MCC_SignalKill(pid, sig.value) }
        concurrentSignalCount.fetchAdd(1)
    }
    
    sleep(Duration.second * 2)
    
    let entered = handlerEnteredCount.load()
    let completed = handlerCompletedCount.load()
    
    if (entered >= 1 && completed >= 1) {
        println("Signal handler concurrent test passed")
        println("Handler entered: ${entered}, completed: ${completed}")
        println("No deadlock detected")
    } else {
        println("FAIL: Handler may have deadlocked")
        println("Handler entered: ${entered}, completed: ${completed}")
    }
}

func testSignalHandlerReentrancy(): Unit {
    resetSignalHandler()
    
    let sig = Signal(0xa, "SIGUSR1")
    let reentrantCount = AtomicInt32(0)
    let maxReentrancy = AtomicInt32(0)
    
    let handler = {
        i: Int32 =>
            let current = reentrantCount.fetchAdd(1) + 1
            if (current > maxReentrancy.load()) {
                maxReentrancy.store(current)
            }
            sleep(Duration.millisecond * 50)
            reentrantCount.fetchSub(1)
            return true
    }
    
    registerSignalHandler(sig, handler)
    
    let pid = Int32(getProcessId())
    
    spawn {
        unsafe { CJ_MCC_SignalKill(pid, sig.value) }
    }
    spawn {
        sleep(Duration.millisecond * 10)
        unsafe { CJ_MCC_SignalKill(pid, sig.value) }
    }
    
    sleep(Duration.second * 1)
    
    let maxReent = maxReentrancy.load()
    if (maxReent <= 1) {
        println("Reentrancy protection works correctly")
        println("Max concurrent handlers: ${maxReent}")
    } else {
        println("WARNING: Multiple handlers ran concurrently: ${maxReent}")
    }
}

main() {
    testConcurrentSignalHandling()
    testSignalHandlerReentrancy()
}
