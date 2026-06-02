// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

// global lambda and local mutex
let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()

let a = {
    synchronized(mtx1) {
        synchronized(mtx2) {
            synchronized(mtx3) {
                println("seq1")
            }
        }
    }
}

func func1() {
    synchronized(mtx2) {
        synchronized(mtx1) {
            println("seq2")
        }
    }
}

func func2() {
    spawn {
        synchronized(mtx2) {
            synchronized(mtx1) {
                println("seq2")
            }
        }
    }
}

func func3() {
    let mtx1: ReentrantMutex = ReentrantMutex()
    let mtx2: ReentrantMutex = ReentrantMutex()
    spawn {
        synchronized(mtx2) {
            synchronized(mtx1) {
                println("seq2")
            }
        }
    }
}

main() {
    return
}
