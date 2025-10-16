// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import std.posix.*

internal import std.sync.*

// unlock error
func test() {
    var m1 = ReentrantMutex()
    var a = 1
    try {
        var m2 = ReentrantMutex()
        m1.lock()
        m2.lock()
    } catch (e: RuntimeException) {
        a = 2
    } finally {
        var m3 = ReentrantMutex()
        var m4 = ReentrantMutex()
        m3.unlock()
        m4.lock()
    }

    return 0
}

main() {
    return 0
}

