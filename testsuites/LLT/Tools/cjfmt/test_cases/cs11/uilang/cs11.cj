// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjmp

public common interface I1 {
    open common func f1(): Unit
}

public common interface I2 {
    open common func f2(): Unit
}

public common interface I3 {
    open common func f3(): Unit
}

public common class Foo {}

common extend Foo <: I1 & I2 & I3 {
    public common func f1(): Unit {}
    public common func f2(): Unit {}
    public common func f3(): Unit {}
}