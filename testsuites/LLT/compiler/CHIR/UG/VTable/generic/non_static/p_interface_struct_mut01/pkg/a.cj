// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface I<T> {
    mut func f1(x: T): T {
        f2(x)
    }
    mut func f2(x: T): T
}

public struct S1 {
    public var field = 1
}

extend S1 <: I<Int64> & I<Bool> {
    public mut func f2(x: Int64): Int64 {
        field = 3
        0
    }
    public mut func f2(x: Bool): Bool {
        field = 3
        true
    }
}
