/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*
import std.sync.*

let m = Monitor()

@C
foreign func pthread_threadid_np(x: CPointer<Unit>, y: CPointer<UInt64>): Int32

func gettid(): UInt64 {
    unsafe {
        var tid: UInt64 = 0
        pthread_threadid_np(CPointer<Unit>(), inout tid)
        tid
    }
}

func tryToSwitchOSThread(): Unit {
    let before = gettid()
    synchronized(m) {
        m.notifyAll()
        m.wait()
    }
    let after = gettid()
    if (before != after) {
        println("OS THREAD SWITCHED!")
    }
}

@ObjCImpl
public class A <: M {
    public init() {}
    public open func foo(): S {
        var s = S()
        s.x = 1
        s.y = 1
        s
    }
    public open func testExclusiveScope(): Unit {
        spawn {
            while (true) {
                unsafe { A.bar() }
            }
        }
        let f = spawn {
            while (true) {
                synchronized(m) {
                    m.notifyAll()
                    m.wait()
                }
            }
        }
        try {
            f.get(Duration.second * 5)
        } catch (e: Exception) {
        }
    }

    public static unsafe func bar(): M {
        exclusiveScope {
            tryToSwitchOSThread()
            M()
        }
    }
}
