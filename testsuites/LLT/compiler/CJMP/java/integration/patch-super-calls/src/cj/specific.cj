// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib

import java.lang.*

@JavaMirror["com.java.lib.NewBase"]
open class NewBase {
    init()
}

@JavaImpl
specific class Child <: NewBase {
}

@JavaImpl
specific class Child2 <: NewBase {
}

@JavaImpl
public class MyMain {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        let _ = Child()
        let _ = Child2()
        print("both constructions complete", flush: true)
    }
}
