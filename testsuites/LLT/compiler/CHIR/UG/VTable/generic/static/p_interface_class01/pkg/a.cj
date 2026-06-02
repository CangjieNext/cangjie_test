// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface III1<T> {
    public static func foo1(a: T): Int64 {
        0
    }
    public static func foo2(): Int64 {
        1
    }
}

public interface III2 <: III1<Int32> {
    public static func foo1(a: Int32): Int64 {
        2
    }
}

public class AAA <: III1<Int64> & III2 {
    public static func foo1(a: Int64): Int64 {
        3
    }
    public static func foo2(): Int64 {
        4
    }
}
