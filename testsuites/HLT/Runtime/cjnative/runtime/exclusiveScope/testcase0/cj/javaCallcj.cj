/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(): Unit
}

public func callNative(): Unit {
    unsafe {
        let cmsg = LibC.mallocCString("cangjie -> cpp -> java!")
        triggerCallback(0, cmsg)
        triggerCallbackWithNewNativeThread(0, cmsg)
        printJavaHello()
    }
}

@C
public func cjOnEvent(): Unit {
    spawn {
        println("spawn begin")
        exclusiveScope {
            println("exclusiveScope begin")
            callNative()
            println("exclusiveScope end")
        }
        println("spawn end")
    }
}
