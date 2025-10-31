/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
common public interface I<T> {
    common func f(a: T, b: T) { a }
}
public class A<T> <: I<T> {}
public common class B<T, K> where T <: I<K> {
    public var a: T
    public var b: K
    public common init(a: T, b: K, c: K) {
        this.a = a
        this.b = a.f(b, b)
    }
}
public func f1() {
    B<A<Int64>, Int64>(A<Int64>(), 1, 2).b
}
