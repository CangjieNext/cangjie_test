// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface III1<T> {
    func foo1(a: T): T
}

public open class AAA<T> <: III1<T> {
    public func foo1(a: T): T {
        a
    }
}

public interface III2<T> {
    func foo1(a: T): T {
        a
    }
}

public class BBB <: AAA<Int32> & III2<Int64> {}
