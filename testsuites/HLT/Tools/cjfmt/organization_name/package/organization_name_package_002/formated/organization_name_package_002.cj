/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org::default

class C1 {
    var a = 1
    public func f1(): Unit {
        println("hello")
    }
}

enum E1 {
    AB
}

main() {
    var a1 = C1()
    var a2 = a1.a
    var a3 = a1.f1()
    var a4 = E1.AB
    0
}
