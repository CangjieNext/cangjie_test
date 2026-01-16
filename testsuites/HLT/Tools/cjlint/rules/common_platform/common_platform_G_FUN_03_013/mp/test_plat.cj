/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform interface A {
    platform func foo1(a: Int64): Unit {
        print(a)
    }
}

platform class C1 <: A{
    platform func foo2(): Unit {}
    func foo4(): Int64 {}
}
