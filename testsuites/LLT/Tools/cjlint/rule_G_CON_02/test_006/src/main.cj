// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import std.posix.*

internal import std.sync.*

// not release
func test() {
    var m = ReentrantMutex()
    var a = 1
    try {
    } catch (e: Exception) {
        a = 2
    } finally {
        m.unlock()
        a = 3
    }

    return 0
}

main() {
    return 0
}

