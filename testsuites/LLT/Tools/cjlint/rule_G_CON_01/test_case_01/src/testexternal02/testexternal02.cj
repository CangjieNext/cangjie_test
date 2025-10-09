// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package testexternal02

internal import std.io.*
internal import std.sync.*

public open class TestExternal02 {
    public let mtx : ReentrantMutex = ReentrantMutex()

    public open func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}
