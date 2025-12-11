// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep

import ohos.labels.*

@!Hide[isChecking: true]
public open class A {
    @!Hide[isChecking: true]
    public var a = 1
    @!Hide[isChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: true]
    public A(@!Hide[isChecking: true] public var v!: Int64 = 1) {}
    @!Hide[isChecking: true]
    public init(@!Hide[isChecking: true] a!: String) { v = 2 }
    @!Hide[isChecking: true]
    public func foo(@!Hide[isChecking: true] a: Int64) {}
}

@!Hide[isChecking: true]
public enum B {
    | @!Hide[isChecking: true] AA
    | @!Hide[isChecking: true] BB(Int64)

    @!Hide[isChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: true]
    public func foo(@!Hide[isChecking: true] a: Int64) {}
}

@!Hide[isChecking: true]
extend A {
    @!Hide[isChecking: true]
    public prop c: Int64 { get() {1} }
    @!Hide[isChecking: true]
    public func goo(@!Hide[isChecking: true] a: Int64) {}
}

@!Hide[isChecking: true]
public var aaa = 1
@!Hide[isChecking: true]
public func goo(@!Hide[isChecking: true] a: Int64) {}

@!Hide[isChecking: true]
public class C<T> {}

public class D<T> {}

public enum E {
    | @!Hide[isChecking: true] AA
    | @!Hide[isChecking: true] BB(Int64)

    @!Hide[isChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[isChecking: true]
    public func foo(@!Hide[isChecking: true] a: Int64) {}
}
