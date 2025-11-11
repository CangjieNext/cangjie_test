// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

interface I1 {
    func f1(): Unit
}

interface I2 {
    func f2(a: Int32): Unit
}

interface I3 {
    func f3(): Int32
}

public class Foo {}

extend Foo {
    public func f1(): Unit {
        print("cj: f1 from func in cj.Foo <: I1\n", flush: true)
    }
    public func f2(a: Int32): Unit {
        print("cj: f2(${a}) from func in cj.Foo <: I2\n", flush: true)
    }
    public func f3(): Int32 {
        print("cj: f3(): Int32 from func in cj.Foo <: I3\n", flush: true)
        100
    }
}