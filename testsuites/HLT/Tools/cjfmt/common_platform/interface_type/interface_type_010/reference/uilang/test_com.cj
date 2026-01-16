/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public interface Iterable<E> {
    common public func iterator(): Unit
}

common public interface Iterator<E> <: Iterable<E> {
    common public func next(a: Option<E>): Option<E>
}

common public interface Collection<T> <: Iterable<T> {
    common public prop size: Int64
    common public func isEmpty(): Bool
}
