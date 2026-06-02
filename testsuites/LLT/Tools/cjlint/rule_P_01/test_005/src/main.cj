// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

// Test different expressions
let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()

func func1() {
    try {
        synchronized(mtx1) {
            synchronized(mtx2) {
                println("seq1")
            }
        }
    } catch (e: Exception) {}
}

func func2() {
    if (true) {
        synchronized(mtx2) {
            synchronized(mtx1) {
                println("seq2")
            }
        }
    }

    if (false) {
        synchronized(mtx3) {
            synchronized(mtx2) {
                println("left -> right lock.")
            }
        }
    }
}

func func4(): Int64 {
    var a = {
        synchronized(mtx1) {
            synchronized(mtx2) {
                synchronized(mtx3) {
                    println("seq 3")
                }
            }
        }

        1
    }() + 0

    return a
}

main() {
    while (false) {
        synchronized(mtx3) {
            synchronized(mtx2) {
                println("left -> right lock.")
            }
        }
    }
}
