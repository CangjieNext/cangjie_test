// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

// Test class member functions and ordinary functions to access global locks
let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()

class StructTest {
    public open func func1() {
        synchronized(mtx1) {
            synchronized(mtx2) {
                synchronized(mtx3) {
                    println("seq 1.")
                }
            }
        }

        synchronized(mtx1) {
            synchronized(mtx3) {
                synchronized(mtx2) {
                    println("seq 2.")
                }
            }
        }
    }

    public open func func2() {
        synchronized(mtx1) {
            synchronized(mtx3) {
                synchronized(mtx2) {
                    println("seq 2.")
                }
            }
        }
    }
}

func func3() {
    synchronized(mtx3) {
        synchronized(mtx2) {
            synchronized(mtx1) {
                println("seq 3.")
            }
        }
    }
}

main(): Int64 {
    return 0
}
