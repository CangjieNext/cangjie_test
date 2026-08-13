// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public interface I {}
public struct S <: I {}
public class C <: I {}

public open class Base {}
public open class Sub <: Base {}

public struct Foo {
    // 场景一：将函数f1的返回类型改为C，为API+ABI均兼容
    public static func f1(): C { return C() }

    public static func f2(): I { return S() }
}