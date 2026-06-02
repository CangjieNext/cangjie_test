// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

interface III1<T> {
    public static func foo(a: (Int32, T)): Int64 {
        1
    }
}

interface III2<T> {
    public static func foo(a: (T, Unit)): Int64
}

public struct AAA {
}

extend AAA <: III1<Unit> {
    public static func foo(a: (Int32, Unit)): Int64 {
        3
    }
}

extend AAA <: III2<Int32> {}
