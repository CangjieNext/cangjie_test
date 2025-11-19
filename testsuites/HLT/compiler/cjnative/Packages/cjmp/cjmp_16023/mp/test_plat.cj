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
platform extend <T, K> B<T, K> where T <: I<K> {
    public platform func foo(a: T, b: K, c: K) {
        a.f(b, c)
    }
}
public func f2() {
    B<A<Int64>, Int64>().foo(A<Int64>(), 1, 2)
}
