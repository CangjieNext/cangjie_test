/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// (not O2)RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

@Test
class Test_DumpCurrentThread {
    @TestCase
    func getFromRunning() {
        let _thread = spawn {
            let _thread_info = ThreadSnapshot.dumpCurrentThread()
            @Assert(_thread_info.id is Int64)
            @Assert(_thread_info.name, "")
            match(_thread_info.state) {
                case ThreadState.Running => println("Running")
                case _ => @Assert(false)
            }
            _thread_info.toString() |> println
            @Assert(_thread_info.stackTrace[0].toString().contains("std.core.ThreadSnapshot::dumpCurrentThread"))
            @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Running)"))
            @Assert(_thread_info.toString().contains("stack trace"))
        }
        sleep(Duration.second * 2)
    }

    @TestCase
    func getFromNestedSpawn() {
        let _thread_infos = ArrayList<ThreadSnapshot>()
        let _thread = spawn {
            spawn {
                sleep(Duration.second)
                _thread_infos.add(ThreadSnapshot.dumpCurrentThread())
            }
            sleep(Duration.second * 10)
        }
        sleep(Duration.second * 2)
        let _thread_info = _thread_infos[0]
        @Assert(_thread_info.id is Int64)
        @Assert(_thread_info.name, "")
        match(_thread_info.state) {
            case ThreadState.Running => println("Running")
            case _ => @Assert(false)
        }
        _thread_info.toString() |> println
        @Assert(_thread_info.stackTrace[0].toString().contains("std.core.ThreadSnapshot::dumpCurrentThread"))
        @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Running)"))
        @Assert(_thread_info.toString().contains("stack trace"))
    }

    @TestCase
    func getFromInvoking() {
        let _thread_infos = ArrayList<ThreadSnapshot>()
        func foo() {
            if (_thread_infos.size == 0) {
                _thread_infos.add(ThreadSnapshot.dumpCurrentThread())
            } else {
                sleep(Duration.second)
                _thread_infos[0] = ThreadSnapshot.dumpCurrentThread()
            }
        }
        let _thread = spawn {
            while (true) {
                foo()
            }
        }
        sleep(Duration.second)
        let _thread_info = _thread_infos[0]
        @Assert(_thread_info.id is Int64)
        @Assert(_thread_info.name, "")
        match(_thread_info.state) {
            case ThreadState.Running => println("Running")
            case _ => @Assert(false)
        }
        _thread_info.toString() |> println
        @Assert(_thread_info.stackTrace[0].toString().contains("std.core.ThreadSnapshot::dumpCurrentThread"))
        @Assert(_thread_info.stackTrace[1].toString().contains("default.Test_DumpCurrentThread::getFromInvoking::foo"))
        @Assert(_thread_info.toString().contains("ThreadSnapshot(id=${_thread_info.id}, name=, state=Running)"))
        @Assert(_thread_info.toString().contains("stack trace"))
    }
}
