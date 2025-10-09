// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import std.sync.*

internal import testexternal01.TestExternal01
internal import testexternal02.TestExternal02
internal import testexternal03.TestExternal03
internal import testinternal.G_MTX

let G_MTX_DEFAULT_1 : ReentrantMutex = ReentrantMutex()
public let G_MTX_DEFAULT_2 : ReentrantMutex = ReentrantMutex()

class SomeObject {
    public let mtx : ReentrantMutex = ReentrantMutex()
    public func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

class SomeObject1 {
    let mtx : ReentrantMutex = ReentrantMutex()
    public func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

class SomeObject2 {
    protected let mtx : ReentrantMutex = ReentrantMutex()
    public func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

class SomeObject3 {
    private let mtx : ReentrantMutex = ReentrantMutex()
    public func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

class SomeObject4 <: TestExternal01 {
    public override func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

class SomeObject5 <: TestExternal02 {
    public override func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}

main() {
    var so =  SomeObject()
    synchronized(so.mtx) {
        let a = 1
    }

    var so1 =  SomeObject1()
    synchronized(so1.mtx) {
        let a = 1
    }

    var so2 =  SomeObject2()
    synchronized(so2.mtx) {
        let a = 1
    }

    return 0
}
