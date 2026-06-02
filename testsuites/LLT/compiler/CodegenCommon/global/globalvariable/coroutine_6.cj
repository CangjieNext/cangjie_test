// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt %enableCompileDebug p1/p1_file.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %enableCompileDebug coroutine_6.cj p1.%middle -o %output

internal import p1.*
internal import std.sync.*

/* 查看跨包子协程 ready running pending 状态*/
main(): Int64 {
    var (fut, m) = son_thread()

    sleep(Duration.second * 1)
    m.lock()
    m.notifyAll()
    m.unlock()
    // Wait for all threads finished.
    fut.get()

    return 0
}
