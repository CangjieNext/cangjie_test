/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface<T> {
    func foo1(): Int64
    func foo2(a!: Int64): Int64 {
        a + foo1()
    }
    func foo4(): Int64
}

public interface MyInterface<T> <: fatherInterface<T> {
    func foo3(): Int64 {
        foo2(a: 30)
    }
}
