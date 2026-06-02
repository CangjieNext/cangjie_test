/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    static func foo2<T>(a!: T): T {
        a
    }
}

public interface MyInterface<T> <: faterInterface<T> {
    func foo3(a: T): T {
        a
    }
}

extend Int64 <: MyInterface<IntNative> {}
