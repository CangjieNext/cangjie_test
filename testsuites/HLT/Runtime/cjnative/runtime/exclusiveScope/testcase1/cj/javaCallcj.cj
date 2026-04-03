/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package javacallcj

foreign func printJavaHello(msg: CString): Unit

@C
public func cjOnEvent(): Unit {
    for (i in 0..10) {
        spawn {
            for (j in 0..10) {
                exclusiveScope {
                    unsafe {
                        printJavaHello(LibC.mallocCString("outer ${i} ${j}"))
                    }

                    for (k in 0..5) {
                        spawn {
                            for (l in 0..5) {
                                exclusiveScope {
                                    unsafe {
                                        printJavaHello(LibC.mallocCString("inner ${i} ${j} ${k} ${l}"))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
