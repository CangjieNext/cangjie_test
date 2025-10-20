// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package TestCase.a

import std.sync.ReentrantMutex

var a = 0

open class Base {
    let baseMtx: ReentrantMutex = ReentrantMutex()

    public open func doSomething() {
        synchronized(baseMtx) {
            a++
        }
    }
}

class Derived <: Base {
    public override func doSomething() {
        a++
    }
}