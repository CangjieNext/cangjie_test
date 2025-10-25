// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

public open class A {
    public init() {}

    public func doo(className: Int32): Unit {
        println("in A doo, Call from ${className}")
    }
}