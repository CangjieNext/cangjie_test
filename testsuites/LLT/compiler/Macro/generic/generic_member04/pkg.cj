// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import define.*

public class A {
    public func foo<T>(@M1(a: T)) {
        a
    }
    public func foo1(@M2 a: Int64) {
        a
    }
}
