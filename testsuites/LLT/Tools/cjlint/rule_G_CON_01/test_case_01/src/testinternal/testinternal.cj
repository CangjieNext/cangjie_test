// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package testinternal

internal import std.io.*
internal import std.sync.*

class TestInternal {
    public let mtx : ReentrantMutex = ReentrantMutex()

    public func put(x: Object){
        synchronized(mtx){
            let a = x
        }
    }
}
public let G_MTX : ReentrantMutex = ReentrantMutex()
