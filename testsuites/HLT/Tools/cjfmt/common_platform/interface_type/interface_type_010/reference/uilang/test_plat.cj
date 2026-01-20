/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public interface Iterable<E> {
    specific public func iterator(): Unit {}
}

specific public interface Iterator<E> <: Iterable<E> {
    specific public func next(a: Option<E>): Option<E> {
        a
    }
}

specific public interface Collection<T> <: Iterable<T> {
    specific public prop size: Int64 {
        get() {
            1
        }
    }
    specific public func isEmpty(): Bool {
        true
    }
}
