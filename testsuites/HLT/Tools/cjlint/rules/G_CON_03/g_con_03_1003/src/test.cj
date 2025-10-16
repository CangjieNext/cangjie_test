import std.sync.ReentrantMutex
import a.*

var a = 0

open class Base {
    private let baseMtx: ReentrantMutex = ReentrantMutex()

    public open func doSomething(): Unit {
        synchronized(baseMtx) {
            a++
        }
    }
}

class Derived <: Base {
    @M1
    public func test() {
    }
}

main() {
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
