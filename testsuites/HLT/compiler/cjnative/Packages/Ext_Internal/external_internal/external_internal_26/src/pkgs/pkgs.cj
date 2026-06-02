/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

struct A {
    public static func foo2() {
        return 0
    }
    public static var cc: Int64 = 0
}

public class B {
    public var a = A.foo2
    public static var b = A.cc
}

extend B {
    public func foo1() {
        return a
    }
}
