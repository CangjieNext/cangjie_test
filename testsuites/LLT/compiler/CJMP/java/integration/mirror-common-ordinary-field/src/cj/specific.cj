// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

import java.lang.*

@JavaMirror["pkgj.OrdField"]
specific open class OrdField {
    specific init()
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let f = OrdField()
        println("id=${f.id}")
        f.id = 42
        println("id=${f.id}")
        println("getId=${f.getId()}")
    }
}
