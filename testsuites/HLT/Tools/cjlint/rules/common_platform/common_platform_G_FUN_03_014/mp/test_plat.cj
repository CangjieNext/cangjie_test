/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific extend A {
    specific func foo1(a: Int64): Unit { println(a) }
    specific func foo2(): Unit { println("specific") }
    func foo4(): Int64 { 1 }
}

specific extend Int64 {
    specific func foo1(a: Int64): Unit {
        print(a)
    }
}