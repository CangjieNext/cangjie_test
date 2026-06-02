// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import std.sync.*

var count: Int64 = 0

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    var i: Int64 = 0
    {
        =>
        let mtx1 = mtx
        try {
            mtx.lock()
            count = count + 1
        } finally {
            mtx.unlock()
        }
    }()
    return 0
}
