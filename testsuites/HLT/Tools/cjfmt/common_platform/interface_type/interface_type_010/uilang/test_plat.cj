/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific interface Iterable<E> {
    public specific func iterator(): Unit {}
}

public specific interface Iterator<E> <: Iterable<E> {
    public specific func next(a:Option<E>): Option<E> {a}
}

public specific interface Collection<T> <: Iterable<T> {
    public specific prop size: Int64 {get(){1}}
    public specific func isEmpty(): Bool {true}
}
