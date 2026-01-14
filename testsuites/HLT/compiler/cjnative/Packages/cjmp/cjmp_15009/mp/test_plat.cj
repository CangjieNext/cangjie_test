/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
specific extend <T> A<T> <: I<T> where T <: B<Int64> {
    public specific static func foo3() { 2 }
    public static func foo4() { 1 }
}
public func f2() {
    var a = A<B<Int64>>()
    return a.foo1() + a.foo2() + A<B<Int64>>.foo3() + A<B<Int64>>.foo4()
}
