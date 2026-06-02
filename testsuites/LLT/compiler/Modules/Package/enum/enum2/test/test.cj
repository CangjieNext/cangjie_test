// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

public enum X<T> {
    C | B(T)
}

public class A {
    public var x: Array<X<String>>

    public init() {
        x = Array<X<String>>(0, repeat: X<String>.C)
    }
}
