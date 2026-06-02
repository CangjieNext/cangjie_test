/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public class A<T> {
    public var a: Int32 = 1
    public func foo() {
        return a
    }
}

public class B<T> {
    public static var a: Int32 = 1
    public static func foo() {
        return a
    }
}

public class C<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
    public func foo(x: T) {
        return x
    }
}

public class D<T> {
    public static var a: Option<Int32> = None
    public static func foo(x: Option<Int32>) {
        return x
    }
}

public class E<T> {
    public static func foo<V>(x: V) {
        return x
    }
}
