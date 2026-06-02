// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package a

public type List<T> = MetaList<T>

public interface I {}

public class MetaList<T> where T <: I {
    public init(elements: Array<T>) {}
    public init(elements: T) {}
    public static func foo(p: T): Array<T> {
        [p]
    }
    public static func foo(p: Array<T>): T {
        p[0]
    }
}

public class C <: I {}
