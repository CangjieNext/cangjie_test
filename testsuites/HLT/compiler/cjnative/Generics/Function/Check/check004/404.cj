/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test404

public open class A<X, Y> {
    public static func test(a: Int64, b: Int64, c: Y) {}
    public static func test(a: Int64, b: Int64, c: X) {}
}

public struct B<X, Y> {
    public static func test(a: Int64, b: Int64, c: Y) {}
    public static func test(a: Int64, b: Int64, c: X) {}
}

public enum C<X, Y> {
    E

    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}
