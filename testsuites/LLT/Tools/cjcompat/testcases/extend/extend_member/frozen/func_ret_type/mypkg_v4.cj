// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V4
public interface I {}
public struct S <: I {}
public class C <: I {}

public open class Base {}
public open class Sub <: Base {}

public class Foo {}

extend Foo {
    static func f1(): I { return C() }

    // 场景四：将函数f2的返回类型改为Sub，为API和ABI均不兼容
    static func f2(): Sub { return Sub() }
    @Frozen
    public static func f3(): Int64 { f1();f2();0 }
}