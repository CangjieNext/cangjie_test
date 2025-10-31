/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
type i<V> = I<V>
public interface I<T> {
    func f(a: T) { a }
}
public class A<T> <: i<T> {}
public common func foo<T, K>(a: T, b: K, c: K) where T <: i<K> {
    return a.f(b)
}
public func f1() {
    foo<A<Int64>, Int64>(A<Int64>(), 1, 2)
}
