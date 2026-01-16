/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform interface Iterable<E> {
    public platform func iterator(): Unit {}
}

public platform interface Iterator<E> <: Iterable<E> {
    public platform func next(a:Option<E>): Option<E> {a}
}

public platform interface Collection<T> <: Iterable<T> {
    public platform prop size: Int64 {get(){1}}
    public platform func isEmpty(): Bool {true}
}
