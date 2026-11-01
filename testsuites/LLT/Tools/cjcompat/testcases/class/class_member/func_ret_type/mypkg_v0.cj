// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public interface I {}
public struct S <: I {const S() {}}
public class C <: I {}

public open class Base {}
public open class Sub <: Base {}

public class Foo {
    const init() {}
    public func f1(): I { return C() }

    public func f2(): I { return S() }

    const public func f3(): Unit { f4(); }

    const func f4(): I { return S() }
}