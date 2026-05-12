/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
type i<V> = I<V>
public common interface I<T> {
    common func f(a: T, b: T) { a }
}
public class A<T> <: i<T> {}
public func f1<T, K>(a: T, b: K, c: K) where T <: i<K> {
    return a.f(b, c)
}
