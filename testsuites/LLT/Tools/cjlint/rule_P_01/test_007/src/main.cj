// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

// Test spawn expressions
let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()
let mtx4: ReentrantMutex = ReentrantMutex()
let mtx5: ReentrantMutex = ReentrantMutex()

func func1() {
    spawn {
        synchronized(mtx1) {
            synchronized(mtx2) {
                println("seq1")
            }
        }
    }

    synchronized(mtx2) {
        synchronized(mtx1) {
            println("seq1")
        }
    }

    spawn {
        synchronized(mtx1) {
            synchronized(mtx2) {
                println("seq1")
            }
        }
    }
}

main() {
    return
}
