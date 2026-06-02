/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan pass

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

class NotInlining {
    public static func notInlineable(): Unit {}
}

class EA03 {
    public static func testMonitorSnippet(): Int32 {
        var v: Int32 = 0
        var x: ReentrantMutex = ReentrantMutex()
        var y: ReentrantMutex = ReentrantMutex()
        var z: ReentrantMutex = ReentrantMutex()
        synchronized(x) {
            synchronized(y) {
                synchronized(z) {
                    NotInlining.notInlineable()
                }
            }
        }
        return v
    }

    public static func testMonitor2Snippet(): Int32 {
        var v: Int32 = 0
        var x: ReentrantMutex = ReentrantMutex()
        var y: ReentrantMutex = ReentrantMutex()
        var z: ReentrantMutex = ReentrantMutex()
        synchronized(x) {
            synchronized(y) {
                synchronized(z) {
                    NotInlining.notInlineable()
                    return v
                }
            }
        }
    }
}

main(): Int64 {
    var x1: Int32 = EA03.testMonitorSnippet()
    var x2: Int32 = EA03.testMonitor2Snippet()
    if (x1 == 0 && x2 == 0) {
        print("pass")
    } else {
        print("fail")
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
