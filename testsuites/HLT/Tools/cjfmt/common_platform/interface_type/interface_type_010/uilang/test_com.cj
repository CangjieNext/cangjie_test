/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface Iterable<E> {
    public common func iterator():Unit
}

public common interface Iterator<E> <: Iterable<E> {
    public common func next(a: Option<E>): Option<E>
}

public common interface Collection<T> <: Iterable<T> {
    public common prop size: Int64
    public common func isEmpty(): Bool
}
