// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

import java.lang.*

@JavaMirror["java.lang.Exception"]
specific open class Exception {
    specific init()
    init(msg: String)
    specific func getMessage(): ?String
}

@JavaImpl
public specific class C <: Exception {
    specific public init() {
        super("my message")
    }
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let c = C()
        let msg = c.getMessage()
        println(msg ?? "null")
        println(c.getValue())
    }
}