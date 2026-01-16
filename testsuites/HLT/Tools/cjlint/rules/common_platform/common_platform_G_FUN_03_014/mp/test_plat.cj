/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform extend A {
    platform func foo1(a: Int64): Unit { println(a) }
    platform func foo2(): Unit { println("platform") }
    func foo4(): Int64 { 1 }
}

platform extend Int64 {
    platform func foo1(a: Int64): Unit {
        print(a)
    }
}