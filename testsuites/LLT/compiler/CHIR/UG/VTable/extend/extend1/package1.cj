// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

public open class A1 {
    public open func xxx() {
        println(2)
    }
    public open func yyy() {}
}

public open class A2 <: A1 {}
