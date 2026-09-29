// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

import java.lang.*

@JavaMirror["java.lang.Exception"]
specific open class Base {
    specific init()
    init(msg: String)
}

@JavaImpl
public specific class C <: Base {
    specific public init() {
        super("mirror-impl-common-var-write")
    }
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let c = C()
        println("value=${c.value}")
        c.value = 5
        println("value=${c.value}")
        println("bump=${c.bump()}")
        println("value=${c.value}")
    }
}
