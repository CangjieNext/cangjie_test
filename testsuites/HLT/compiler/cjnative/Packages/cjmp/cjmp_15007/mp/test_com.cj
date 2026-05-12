/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public import mp1.*
public class B<T> {
    public var a: T
    public init(a: T) {
        this.a = a
    }
}
interface I<T> {
    func foo1(a: T) { a }
}
common extend <T> A<T> <: I<T> {
    public func foo2(a: B<Int64>) { a.a }
    public common static func foo3(a: B<Int64>) { a.a }
}
public func f1() {
    var a = A<B<Int64>>()
    return a.foo1(B<Int64>(1)).a + a.foo2(B<Int64>(1)) + A<B<Int64>>.foo3(B<Int64>(1))
}
