/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

public class A {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }
    public operator func [](index: B, value!: Int64): Unit {
        this.b = value
    }
}

public class B {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }
    public operator func [](index: B, value!: Int64): Unit {
        this.b = value
    }
}
