/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 支持class关键字+类名称+成员变量+成员函数语法高亮
class Data1 {
    var cc = 0
    let d: String = "hello"
    Data1(let a!: Int64 = 1) {}
    init(b!: Int32 = 2) {
        this.a = 2
    }
    init() {
        this.a = 1
    }
    func foo(): String {
        return bar()
    }
    func foo(x: Int32): String {
        this.a.toString()
    }
    func bar(): String {
        "bar"
    }

    static func s_func(): Rune {
        r'a'
    }
}

var a1 = Data1(b: 1).d
