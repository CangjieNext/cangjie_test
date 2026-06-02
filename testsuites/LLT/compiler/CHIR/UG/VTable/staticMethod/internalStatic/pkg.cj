// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public open class A1 {
    static func foo() {
        println(1)
    }
    public func goo() {
        println(2)
    }
}

public class A2 <: A1 {}
