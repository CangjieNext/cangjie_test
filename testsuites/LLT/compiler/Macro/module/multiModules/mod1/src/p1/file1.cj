// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mod1.p1

public func foo1() {
    println("foo1 in p1")
}

public func call_bar() {
    println("call_bar in p1")
    bar1()
}
