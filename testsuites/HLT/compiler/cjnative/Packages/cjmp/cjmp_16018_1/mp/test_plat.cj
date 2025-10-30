/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public platform interface I<T> {
    platform func f(a: T, b: T) { b }
}
public func f2<T, K>(a: T, b: K, c: K) where T <: I<K> {
    return a.f(b, c)
}
