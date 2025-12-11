// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package ohos.dep

import ohos.labels.*

@!Hide[isChecking: false]
public open class A {
    @!Hide[isChecking: false]
    public var a = 1
    @!Hide[isChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: false]
    public A(@!Hide[isChecking: false] public var v!: Int64 = 1) {}
    @!Hide[isChecking: false]
    public init(@!Hide[isChecking: false] a!: String) { v = 2 }
    @!Hide[isChecking: false]
    public func foo(@!Hide[isChecking: false] a: Int64) {}
}

@!Hide[isChecking: false]
public enum B {
    | @!Hide[isChecking: false] AA
    | @!Hide[isChecking: false] BB(Int64)

    @!Hide[isChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: false]
    public func foo(@!Hide[isChecking: false] a: Int64) {}
}

@!Hide[isChecking: false]
extend A {
    @!Hide[isChecking: false]
    public prop c: Int64 { get() {1} }
    @!Hide[isChecking: false]
    public func goo(@!Hide[isChecking: false] a: Int64) {}
}

@!Hide[isChecking: false]
public var aaa = 1
@!Hide[isChecking: false]
public func goo(@!Hide[isChecking: false] a: Int64) {}

public enum E {
    | @!Hide[isChecking: false] AA
    | @!Hide[isChecking: false] BB(Int64)

    @!Hide[isChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: false]
    public func foo(@!Hide[isChecking: false] a: Int64) {}
}
