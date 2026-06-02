/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    func foo1(): T
    func foo2(a!: T): T {
        foo1();
        return a
    }
    func foo4(): T
}

public interface MyInterface<T> <: faterInterface<T> {
    mut func foo3(a!: T): T {
        foo1()
    }
}
