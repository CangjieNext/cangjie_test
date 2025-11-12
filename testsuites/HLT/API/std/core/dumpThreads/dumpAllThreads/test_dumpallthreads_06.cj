/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*

public func foo() {
    while (true) {
        if (Thread.currentThread.hasPendingCancellation) {
            println("Thread.currentThread.hasPendingCancellation")
            return 0
        }
    }
    return 1
}

// check threadstate changes
main() {
    let _thread = spawn { 
        sleep(Duration.second * 3)
        foo()
    }
    var _thread_infos = ThreadSnapshot.dumpAllThreads()

    @Assert(_thread_infos.size, 2)
    var _thread_info = _thread_infos[0]
    match(_thread_info.state) {
        case ThreadState.Ready => println("Ready")
        case _ => @Assert(false)
    }
    _thread_info.toString() |> println
    @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Ready)"))

    sleep(Duration.second)
    _thread_infos = ThreadSnapshot.dumpAllThreads()
    @Assert(_thread_infos.size, 2)
    _thread_info = _thread_infos[0]
    match(_thread_info.state) {
        case ThreadState.Pending => println("Pending")
        case _ => @Assert(false)
    }
    _thread_info.toString() |> println
    @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Pending)"))

    sleep(Duration.second * 3)
    _thread_infos = ThreadSnapshot.dumpAllThreads()
    @Assert(_thread_infos.size, 2)
    @Assert(_thread.thread.state.toString(), "Running")
    _thread_info = _thread_infos[0]
    match(_thread_info.state) {
        case ThreadState.Running => println("Running")
        case _ => @Assert(false)
    }
    _thread_info.toString() |> println
    @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Running)"))

    _thread.cancel()
    sleep(Duration.second)
    _thread_infos = ThreadSnapshot.dumpAllThreads()
    @Assert(_thread_infos.size, 1)
    @Assert(_thread.thread.state.toString(), "Terminated")
    @Assert(_thread.get(), 0)
}
