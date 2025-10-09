// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*

let mtx1: ReentrantMutex = ReentrantMutex()
let mtx2: ReentrantMutex = ReentrantMutex()
let mtx3: ReentrantMutex = ReentrantMutex()

// Test global member mutex, class member mutex and local mutex.
class ClassTest {
    private let mtx1: ReentrantMutex = ReentrantMutex()
    private let mtx2: ReentrantMutex = ReentrantMutex()
    public func func1() {
        let mtx4: ReentrantMutex = ReentrantMutex()
        let mtx5: ReentrantMutex = ReentrantMutex()
        synchronized(mtx1) {
            synchronized(mtx2) {
                synchronized(mtx3) {
                    println("seq 1.")
                }
            }
        }
    }

    public func func2() {
        let mtx4: ReentrantMutex = ReentrantMutex()
        let mtx5: ReentrantMutex = ReentrantMutex()
        synchronized(mtx1) {
            synchronized(mtx2) {
                synchronized(mtx5) {
                    println("seq 2.")
                }
            }
        }
    }

    public func func3() {
        let mtx4: ReentrantMutex = ReentrantMutex()
        let mtx5: ReentrantMutex = ReentrantMutex()
        synchronized(mtx3) {
            synchronized(mtx4) {
                synchronized(mtx5) {
                    println("seq 2.")
                }
            }
        }
    }

    public func func4() {
        let mtx4: ReentrantMutex = ReentrantMutex()
        let mtx5: ReentrantMutex = ReentrantMutex()
        synchronized(mtx3) {
            synchronized(mtx5) {
                synchronized(mtx4) {
                    println("seq 2.")
                }
            }
        }
    }

    public func func5() {
        let mtx4: ReentrantMutex = ReentrantMutex()
        let mtx5: ReentrantMutex = ReentrantMutex()
        synchronized(mtx5) {
            synchronized(mtx2) {
                synchronized(mtx1) {
                    println("seq 2.")
                }
            }
        }
    }
}
main(): Int64 {
    return 0
}
