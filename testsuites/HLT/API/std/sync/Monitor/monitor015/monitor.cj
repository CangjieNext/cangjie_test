/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process
import asan.*

main(): Int64 {
    let mtr: Monitor = Monitor()
    let future: Future<Unit> = spawn {
        mtr.notifyAll()
    }
    try {
        let res = future.get()
    } catch (e: IllegalSynchronizationStateException) {
        let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
        let map = ao.getArgumentsMap()
        if (map.contains("--asan")) {
            GC()
            sleep(Duration.second * 2)
        }
        return 0
    } finally {
        asanGC()
    }
    return 1
}
