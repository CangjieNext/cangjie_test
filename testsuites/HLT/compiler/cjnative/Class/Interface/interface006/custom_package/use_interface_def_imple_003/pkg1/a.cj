/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface<T> {
    func foo1(): Int8
    func foo2(): Int8 {
        foo1()
    }
    func foo3(): Int8
}

public interface MyInterface<T> <: fatherInterface<T> {
    func foo2(): Int8 {
        foo1() + foo1()
    }
}
