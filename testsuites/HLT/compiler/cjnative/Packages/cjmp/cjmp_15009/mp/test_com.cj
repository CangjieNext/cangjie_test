/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public import mp1.*
public class B<T> {}
public interface I<T> {
    func foo1() { 1 }
}
common extend <T> A<T> <: I<T> where T <: B<Int64> {
    public func foo2() { 1 }
    public common static func foo3() { 1 }
}
public func f1() {
    var a = A<B<Int64>>()
    return a.foo1() + a.foo2() + A<B<Int64>>.foo3()
}
