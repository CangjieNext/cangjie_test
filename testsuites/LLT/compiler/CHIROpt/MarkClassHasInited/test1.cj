// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler  %f -o %n.%suffix 
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not finalizer

import std.runtime.GC

class C {
    var x: Int

    init() {
        // 未完整初始化的对象
        throw Exception("construct C exception")
    }

    ~init() {
        println("finalizer")
        println(x) // 访问了未初始化的成员
    }
}

main(): Unit {
    try {
        C()
    } catch (e: Exception) {
        println("Exception is caught.")
    }
    GC(heavy: true) // 触发 GC 回收和 finalizer 调用
}
