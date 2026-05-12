/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

@ObjCImpl
public class A <: M {
    public init() {}
    public func foo(): Int64 {
        return 123
    }
}

@ObjCImpl
public class B <: M {
    public init() {}
    @ForeignName["foo:"]
    public func foo(a: A): A {
        a
    }
}
