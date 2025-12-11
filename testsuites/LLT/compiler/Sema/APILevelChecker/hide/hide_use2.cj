// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep

import ohos.labels.*

@!Hide[needCompilerChecking: false]
public open class A {
    @!Hide[needCompilerChecking: false]
    public var a = 1
    @!Hide[needCompilerChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: false]
    public A(@!Hide[needCompilerChecking: false] public var v!: Int64 = 1) {}
    @!Hide[needCompilerChecking: false]
    public init(@!Hide[needCompilerChecking: false] a!: String) { v = 2 }
    @!Hide[needCompilerChecking: false]
    public func foo(@!Hide[needCompilerChecking: false] a: Int64) {}
}

@!Hide[needCompilerChecking: false]
public enum B {
    | @!Hide[needCompilerChecking: false] AA
    | @!Hide[needCompilerChecking: false] BB(Int64)

    @!Hide[needCompilerChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: false]
    public func foo(@!Hide[needCompilerChecking: false] a: Int64) {}
}

@!Hide[needCompilerChecking: false]
extend A {
    @!Hide[needCompilerChecking: false]
    public prop c: Int64 { get() {1} }
    @!Hide[needCompilerChecking: false]
    public func goo(@!Hide[needCompilerChecking: false] a: Int64) {}
}

@!Hide[needCompilerChecking: false]
public var aaa = 1
@!Hide[needCompilerChecking: false]
public func goo(@!Hide[needCompilerChecking: false] a: Int64) {}

public enum E {
    | @!Hide[needCompilerChecking: false] AA
    | @!Hide[needCompilerChecking: false] BB(Int64)

    @!Hide[needCompilerChecking: false]
    public prop b: Int64 { get() {1} }
    @!Hide[needCompilerChecking: false]
    public func foo(@!Hide[needCompilerChecking: false] a: Int64) {}
}
