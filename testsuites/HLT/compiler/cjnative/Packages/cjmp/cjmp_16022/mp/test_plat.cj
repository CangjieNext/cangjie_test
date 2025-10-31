/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
platform public interface I<T> {
    platform func f(a: T, b: T) { b }
}
public platform class B<T, K> where T <: A<K> {
    public platform init(a: T, b: K, c: K) {
        this.a = a
        this.b = a.f(b, c)
    }
}
public func f2() {
    B<A<Int64>, Int64>(A<Int64>(), 1, 2).b
}
