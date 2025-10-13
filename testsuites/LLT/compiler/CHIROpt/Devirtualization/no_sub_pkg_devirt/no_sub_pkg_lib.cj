package no_sub_pkg_lib
 
public interface II<T> {
    func foo() {}
}
 
open class A<T> <: II<T> {
    public func foo() {}
}
 
@Frozen
public func gooInner() : II<Int32> {
    return A<Int32>()
}
 
@Frozen
public func goo() : II<Int32> {
    return gooInner()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
