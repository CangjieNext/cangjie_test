package p1

public open class Base {}
public class Sub <: Base {}

public interface I1 {
    func foo(a: Base): Int64
    func foo(a: Sub): Int64 {0}
}

public class A {}

extend A <: I1 {
    public func foo(a: Base): Int64 {0}
    public func foo(a: Sub): Int64 {1}
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
