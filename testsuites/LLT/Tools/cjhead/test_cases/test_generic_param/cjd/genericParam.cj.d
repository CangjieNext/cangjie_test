

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0// with Runtime Library Exception.//// See https://cangjie-lang.cn/pages/LICENSE for license information.
public class List<T> {
    public func foo<T>(a: T): Unit where T <: ToString
}

public open class Node<K, V> where K <: Hashable & Equatable<K> {
    public var key: Option<K> = Option<K>.None
    public var value: Option<V> = Option<V>.None

    public init()

    public init(key: K, value: V)
}

public interface Iterable<E> {
    func iterator(): Iterator<E>
}

public struct Pair<T, U> {
    // init.
    public init(a: T, b: U)
    public func first(): T
    public func second(): U
}

public enum Option<T> {
    Some(T)
    | 
    None

    public func getOrThrow(): T
}

public func id<T>(a: T): T

public func composition<T1, T2, T3>(f: (T1) -> T2, g: (T2) -> T3): (T1) -> T3