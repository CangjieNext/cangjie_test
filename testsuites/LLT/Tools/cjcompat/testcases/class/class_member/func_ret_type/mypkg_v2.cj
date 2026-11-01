// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V2
public interface I {}
public struct S <: I {}
public class C <: I {}

public open class Base {}
public open class Sub <: Base {}

public class Foo {
    public func f1(): I { return C() }

    // 场景二：将函数f2的返回类型改为S，为API兼容，但ABI不兼容，因为返回类型从引用类型变为值类型后，内存布局发生了变化
    public func f2(): S { return S() }
}