// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep

import ohos.labels.*

@!Hide[needCompilerChecking: true]
public open class A {
    @!Hide[needCompilerChecking: true]
    public var a = 1
    @!Hide[needCompilerChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: true]
    public A(@!Hide[needCompilerChecking: true] public var v!: Int64 = 1) {}
    @!Hide[needCompilerChecking: true]
    public init(@!Hide[needCompilerChecking: true] a!: String) { v = 2 }
    @!Hide[needCompilerChecking: true]
    public func foo(@!Hide[needCompilerChecking: true] a: Int64) {}
}

@!Hide[needCompilerChecking: true]
public enum B {
    | @!Hide[needCompilerChecking: true] AA
    | @!Hide[needCompilerChecking: true] BB(Int64)

    @!Hide[needCompilerChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: true]
    public func foo(@!Hide[needCompilerChecking: true] a: Int64) {}
}

@!Hide[needCompilerChecking: true]
extend A {
    @!Hide[needCompilerChecking: true]
    public prop c: Int64 { get() {1} }
    @!Hide[needCompilerChecking: true]
    public func goo(@!Hide[needCompilerChecking: true] a: Int64) {}
}

@!Hide[needCompilerChecking: true]
public var aaa = 1
@!Hide[needCompilerChecking: true]
public func goo(@!Hide[needCompilerChecking: true] a: Int64) {}

@!Hide[needCompilerChecking: true]
public class C<T> {}

public class D<T> {}

public enum E {
    | @!Hide[needCompilerChecking: true] AA
    | @!Hide[needCompilerChecking: true] BB(Int64)

    @!Hide[needCompilerChecking: true]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: true]
    public func foo(@!Hide[needCompilerChecking: true] a: Int64) {}
}
