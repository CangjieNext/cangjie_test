/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 60001

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

class SynchExceptionTest {
    public func write(name: String, len: Int32): Int32 {
        var a: Int32 = 0
        var mtx: ReentrantMutex = ReentrantMutex()
        try {
            synchronized(mtx) {
                a += 1
                throw Exception()
            }
        } catch (e: ArithmeticException) {
            a += 200
        } catch (e: Exception) {
            a += 60000
        }
        return a
    }

    public static func TestMain(c: Int32): Int32 {
        return SynchExceptionTest().write("abc.txt", 1)
    }
}

main(): Int64 {
    print(SynchExceptionTest.TestMain(3))
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
