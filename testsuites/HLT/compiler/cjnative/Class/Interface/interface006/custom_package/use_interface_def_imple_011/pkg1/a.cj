/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface<T> {
    static func foo1(): Float16
    static func foo2<T>(a: T): T {
        return a
    }
}

public interface MyInterface<T> <: fatherInterface<T> {
    static func foo2<T>(a: T): T {
        foo1()
        return a
    }
}
