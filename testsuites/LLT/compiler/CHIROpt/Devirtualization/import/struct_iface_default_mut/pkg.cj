// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
package pkg

public interface I {
    mut func foo1(): Int64
    mut func foo2(): Int64 {
        foo1()
    }
}

public struct S <: I {
    public var x: Int64 = 0
    public mut func foo1(): Int64 {
        x = 1
        return x
    }
}
