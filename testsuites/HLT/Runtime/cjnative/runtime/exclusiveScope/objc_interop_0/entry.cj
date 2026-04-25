/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pack

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

let tryToSwitchOSThread_enabled = true
let goToObjC_enabled = true

@C
public func cj_main(): Unit {
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

public class A {
    public static unsafe func bar(): A {
        exclusiveScope {
            A(
                withAutoreleasePoolObj(
                    {
                        =>
                            if (tryToSwitchOSThread_enabled) {
                                tryToSwitchOSThread()
                            }
                            if (goToObjC_enabled) {
                                goToObjC()
                            } else {
                                CPointer<Unit>()
                            }
                    }
                )
            )
        }
    }

    static unsafe func goToObjC(): CPointer<Unit> {
        CFunc<(CPointer<Unit>, CPointer<Unit>) -> CPointer<Unit>>(objCMsgSend())(getObjCClass(), registerName("bar"))
    }

    public init() {
        this(
            unsafe { CFunc<(CPointer<Unit>, CPointer<Unit>) -> CPointer<Unit>>(objCMsgSend())(alloc("A"),
                registerName("init")) })
    }
    public let obj: CPointer<Unit>
    public func getObj(): CPointer<Unit> {
        this.obj
    }
    public static func getObjCClass(): CPointer<Unit> {
        unsafe { getClass("A") }
    }
    public init(obj: CPointer<Unit>) {
        this.obj = obj
    }
    private var hasInited: Bool = false
    ~init() {
        unsafe { objCRelease(this.obj) }
    }
}
