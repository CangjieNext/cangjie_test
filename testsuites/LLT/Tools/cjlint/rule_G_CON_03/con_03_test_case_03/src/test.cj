// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import std.sync.*

open class Base1 {
    static var b = 1
    private let baseMtx: ReentrantMutex = ReentrantMutex()
    //safe
    public open func doSomethingSafe1() {
        synchronized(baseMtx) {
            let a = 1
        }
    }

    public open func doSomethingSafe2() {
        baseMtx.lock()
        let a = 1
        baseMtx.unlock()
    }

    public open func doSomethingSafe3() {
        let a = 1
    }

    public open func doSomethingSafe4() {
        baseMtx.lock()
        let a = 1
        baseMtx.unlock()
    }

    //unsafe
    public open func doSomethingUnsafe1() {
        b++
    }

    public open func doSomethingUnsafe2() {
        b++
    }
}

class Derived1 <: Base1 {
    private let mtx: ReentrantMutex = ReentrantMutex()
    // unsafe override and safe base, throw error
    override public func doSomethingSafe1() {
        b++
    }
    // unsafe override and safe base, throw error
    override public func doSomethingSafe2() {
        b--
    }
    // unsafe override and safe base, throw error
    override public func doSomethingSafe3() {
        b++
    }
    // unsafe override and safe base, throw error
    override public func doSomethingSafe4() {
        mtx.lock()
        b++
        mtx.unlock()
        b++
    }
    // unsafe override and unsafe base, will not throw error
    override public func doSomethingUnsafe1() {
        b++
    }
    // safe override and unsafe base, will not throw error
    override public func doSomethingUnsafe2() {
        mtx.lock()
        b++
        mtx.unlock()
    }
}