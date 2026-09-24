/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I {
    func f(): Unit
}

struct S {
    var item = 0
}

extend S <: I {
    public func f(): Unit {
        item += 1
    }
}

main() {
    var s = S()
    s.f()
    println(s.item)
}
