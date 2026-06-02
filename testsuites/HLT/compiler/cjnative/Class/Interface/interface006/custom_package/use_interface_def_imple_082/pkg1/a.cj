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
        a
    }
    func foo3(): T
}

public interface MyInterface <: faterInterface<String> {}

extend Rune <: MyInterface {
    func foo(): String {
        "char"
    }

    public func foo3(): String {
        foo1()
    }

    public func foo1(): String {
        foo2(a: foo())
    }
}
