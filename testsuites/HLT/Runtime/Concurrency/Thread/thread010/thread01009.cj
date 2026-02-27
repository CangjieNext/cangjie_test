/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args && cat exp.txt| compare %f
// (CJNATIVE and not iOS) ASSERT: scan id: 2, name: test, exception: Exception: a base exception
// (CJNATIVE and iOS) ASSERT: scan id: 3, name: test, exception: Exception: a base exception
// (not CJNATIVE) ASSERT: scan id: 1, name: test, exception: Exception: a base exception
// ASSERT: scan Exception: a base exception

import std.fs.*

main(): Int64 {
    let file = File(Path("./exp.txt"), OpenMode.Append)
    Thread.handleUncaughtExceptionBy {
        thread: Thread, exception: Exception =>
        file.write(exception.toString().toArray())
        file.write("\n".toArray())
        println("id: ${thread.id}, name: ${thread.name}, exception: ${exception}")
    }

    let fut1 = spawn {
        Thread.currentThread.name = "test"
        throw Exception("a base exception")
    }

    try {
        fut1.get()
    } catch (_: Exception) {
        println("fut1.get()")
    }

    return 0
}
