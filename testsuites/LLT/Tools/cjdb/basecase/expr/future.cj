// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.sync.*
import std.time.*

main(): Int64 {
    let fut1: Future<Int64> = spawn { =>
        println("当前fut1线程ID为：${Thread.currentThread.id},name为：${Thread.currentThread.name}")
        println("New thread before sleeping")
        sleep(1 * Duration.Min)
        println("New thread after sleeping")
        return 0
    }
    let fut2: Future<Int64> = spawn { =>
        println("当前fut2线程ID为：${Thread.currentThread.id},name为：${Thread.currentThread.name}")
        println("New thread before sleeping")
        sleep(1 * Duration.Min)
        println("New thread after sleeping")
        return 0
    }

    println("Main thread")

    fut1.get()
    fut1.get()
    return 0
}
