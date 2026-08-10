// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public interface I {}
public struct S <: I {const S() {}}
public class C <: I {}

public open class Base {}
public open class Sub <: Base {}

public class Foo {
    const init() {}
    // 场景一：将函数f1的返回类型改为C，为API+ABI均兼容
    public func f1(): C { return C() }

    public func f2(): I { return S() }

    const public func f3(): Unit { f4(); }

    const func f4(): I { return S() }
}