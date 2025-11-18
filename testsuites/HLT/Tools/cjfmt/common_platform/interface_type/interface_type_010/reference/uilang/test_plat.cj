/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public interface Iterable<E> {
    platform public func iterator(): Unit {}
}

platform public interface Iterator<E> <: Iterable<E> {
    platform public func next(a: Option<E>): Option<E> {
        a
    }
}

platform public interface Collection<T> <: Iterable<T> {
    platform public prop size: Int64 {
        get() {
            1
        }
    }
    platform public func isEmpty(): Bool {
        true
    }
}
