/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific class Container<T> where T <: Comparable<T> {
    specific var value: T
    specific init(value: T) { this.value = value }
    specific func get(): T { value }
    specific func set(newValue: T): Unit { value = newValue }
    specific func map<R>(convert: (T) -> R): Container<R> where R <: Comparable<R> {
        return Container<R>(convert(value))
    }
}

specific struct Container2<T> where T <: Comparable<T> {
    specific var value: T
    specific init(value: T) { this.value = value }
    specific func get(): T { value }
    specific func set(newValue: T): Unit { value = newValue }
    specific func map<R>(convert: (T) -> R): Container2<R> where R <: Comparable<R> {
        return Container2<R>(convert(value))
    }
}