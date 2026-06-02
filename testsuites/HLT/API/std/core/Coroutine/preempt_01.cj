/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %export cjHeapSize=4GB && %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.collection.*

open class PreemptScheduleTest {
    public static let futureBuf:ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    public static let kThreadCount:Int64 = 64

    public static func AllocateTask(): Unit {
        var count: Int64 = 100
        var index: Int64 = 0
        while (index < count) {
            var arr: Array<Int8> = Array<Int8>(100, {i => 0})
            index++
        }
    }

    public static func WaitAllCoroutinesExit(buf: ArrayList<Future<Unit>>): Unit {
        var i: Int64 = 0
        while (i < buf.size) {
            buf.get(i).getOrThrow().get()
            i++
        }
    }

    public static func TestCase1(): Unit {
        var index: Int64 = 0
        while (index < kThreadCount) {
            let fut: Future<Unit> = spawn {
                => AllocateTask()
            }
            futureBuf.add(fut)
            index++
        }

        WaitAllCoroutinesExit(futureBuf);
    }
}

unsafe main(): Int64 {
    PreemptScheduleTest.TestCase1()
    print("success\n")
    return 0
}
