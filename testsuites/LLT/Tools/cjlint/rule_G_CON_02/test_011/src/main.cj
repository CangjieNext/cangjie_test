// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

var m3 = ReentrantMutex()
let m4 = ReentrantMutex()
struct MutexStruct{
    var tmp:Int64 = 0
    var m1:ReentrantMutex
    var m2:ReentrantMutex
    init() {
        this.m1 = ReentrantMutex()
        this.m2 = ReentrantMutex()
        this.tmp = 1
    }

    func test1(): Bool {
        try {
            this.m1.lock()
            this.m2.unlock()
        } catch (_) {
        }

        return false
    }

    func test2(): Bool {
        try {
            this.m1.unlock()
            m3.lock()
            m4.lock()
        } catch (_) {
        }

        return true
    }

    func test3(): Bool {
        var m2 = ReentrantMutex()
        try {
            this.m1.lock()
            m2.lock()
            this.m1.unlock()
        } catch (_) {
        }

        return true
    }
}

main() {
    return 0
}
