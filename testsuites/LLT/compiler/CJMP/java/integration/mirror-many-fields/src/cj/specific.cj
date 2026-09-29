// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

import java.lang.*

@JavaMirror["pkgj.WithFields"]
specific open class WithFields {
    specific init()
    specific let abc: Int32
    specific let ab: Int32
    specific let a: Int32
    specific let f0: Int32
    specific let f1: Int32
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let w = WithFields()
        println("checksum=${commonChecksum(w)}")
        println("abc=${w.abc} ab=${w.ab} a=${w.a} f0=${w.f0} f1=${w.f1}")
    }
}
