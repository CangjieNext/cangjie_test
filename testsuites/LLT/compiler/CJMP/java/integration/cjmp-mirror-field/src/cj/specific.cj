// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

import java.lang.*

@JavaMirror["pkgj.WithField"]
specific open class WithField {
    specific init()
    specific let x: Int32
    specific static let y: Int32
}

func specificSay(f: WithField) {
    println("say from specific: ${f.x} + ${WithField.y}")
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        println("before say")
        commonSay(WithField())
        specificSay(WithField())
        println("after both say")
    }
}
