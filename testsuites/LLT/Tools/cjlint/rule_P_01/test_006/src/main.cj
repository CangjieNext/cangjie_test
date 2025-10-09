// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

// Test 5 lock
let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()
let mtx4: ReentrantMutex = ReentrantMutex()
let mtx5: ReentrantMutex = ReentrantMutex()

func func1() {
    try {
        synchronized(mtx1) {
            synchronized(mtx2) {
                synchronized(mtx5) {
                    synchronized(mtx4) {
                        synchronized(mtx3) {
                            println("seq1")
                        }
                    }
                }
            }
        }
    } catch (e: Exception) {}
}

func func2() {
    if (true) {
        synchronized(mtx5) {
            synchronized(mtx4) {
                synchronized(mtx3) {
                    synchronized(mtx2) {
                        synchronized(mtx1) {
                            println("seq2")
                        }
                    }
                }
            }
        }
    }
}

main() {
    synchronized(mtx1) {
        synchronized(mtx2) {
            println("seq3")
        }
    }

    synchronized(mtx2) {
        synchronized(mtx1) {
            println("seq4")
        }
    }

    synchronized(mtx5) {
        synchronized(mtx4) {
            synchronized(mtx3) {
                println("seq5")
            }
        }
    }

    synchronized(mtx5) {
        synchronized(mtx3) {
            synchronized(mtx4) {
                println("seq5")
            }
        }
    }
}
