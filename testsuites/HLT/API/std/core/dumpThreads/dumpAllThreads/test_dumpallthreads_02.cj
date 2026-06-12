/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*

// 可能存在线程被回收的可能
main() {
    let _thread = spawn {}
    @Assert(_thread.thread.state.toString(), "Ready")
    let _thread_infos = ThreadSnapshot.dumpAllThreads()
    @Assert(_thread_infos.size, 2)
    let _thread_info = _thread_infos[0]
    @Assert(_thread_info.id is Int64)
    @Assert(_thread_info.name, "")
    match(_thread_info.state) {
        case ThreadState.Ready => println("Ready")
        case _ => @Assert(false)
    }
    _thread_info.toString() |> println
    @Assert(_thread_info.stackTrace.size, 0)
    @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Ready)"))
    @Assert(_thread_info.toString().contains("stack trace"))
}
