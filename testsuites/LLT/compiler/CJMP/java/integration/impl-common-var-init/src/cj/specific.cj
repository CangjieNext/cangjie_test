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
        super("impl-common-var-init")
    }
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let c = C()
        println("iv=${c.iv}")
        println("lv=${c.lv}")
        println("cv=${c.cv}")
        println("sum=${c.sum()}")
        c.iv = 100
        println("iv=${c.iv}")
    }
}
