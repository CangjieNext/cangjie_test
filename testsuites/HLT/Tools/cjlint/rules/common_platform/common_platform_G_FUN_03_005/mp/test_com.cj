/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common class Container<T> where T <: Comparable<T> {
    common var value: T
    common init(value: T) { this.value = value }
    common func get(): T
    common func set(newValue: T): Unit
    common func map<R>(convert: (T) -> R): Container<R> where R <: Comparable<R>
}

common struct Container2<T> where T <: Comparable<T> {
    common var value: T
    common init(value: T) { this.value = value }
    common func get(): T
    common func set(newValue: T): Unit
    common func map<R>(convert: (T) -> R): Container2<R> where R <: Comparable<R>
}