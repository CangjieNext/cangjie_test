// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Component {
    public var a = 0
}

class Div <: Component {
    public var content: Array<Component>

    public init(content!: Array<Component>) {
        this.content = content
    }
}

class Text <: Component {}

main(): Int64 {
    let res = Div(content: [Text()])
    var t = res.content[0]
    res.content[0].a = 70
    var ret = t.a + res.content[0].a
    if (ret == 140) {
        return 0
    } else {
        return -1
    }
}
