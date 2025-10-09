// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

class MutexClass {
    private var m0:ReentrantMutex
    private var m1:ReentrantMutex

    init() {
        this.m1 = ReentrantMutex()
        this.m0 = ReentrantMutex()
    }

    public func test1() {
        try {
            this.m1.lock()
            this.m0.lock()
        } catch (_) {
        } finally {
            this.m1.unlock()
        }
    }

    func test2():Int64 {
        try {
            this.m1.lock()
        } catch (_) {
        } finally {
            this.m0.unlock()
        }

        return 0
    }
}

main() {
    return 0
}
