/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
public class B<T> {
    public var a: T
    public init(a: T) {
        this.a = a
    }
}
interface I {
    func foo1(a: B<Int64>) { a.a }
}
common extend <T> A<T> <: I {
    public func foo2(a: B<Int64>) { a.a }
    public common static func foo3(a: B<Int64>) { a.a }
}
public func f1() {
    var a = A<B<Int64>>()
    return a.foo1(B<Int64>(1)) + a.foo2(B<Int64>(1)) + A<B<Int64>>.foo3(B<Int64>(1))
}
