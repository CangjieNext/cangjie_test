// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class List<T> {
    var elem: Option<T> = None
    var tail: Option<List<T>> = None
    public func foo<T>(a: T): Unit where T <: ToString {
        println("${a}")
    }
}

public open class Node<K, V> where K <: Hashable & Equatable<K> {
    public var key: Option<K> = Option<K>.None
    public var value: Option<V> = Option<V>.None

    public init() {}

    public init(key: K, value: V) {
        this.key = Option<K>.Some(key)
        this.value = Option<V>.Some(value)
    }
}

public interface Iterable<E> {
    func iterator(): Iterator<E>
}

public struct Pair<T, U> {
    let x: T
    let y: U
    // init.
    public init(a: T, b: U) {
        x = a
        y = b
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

public enum Option<T> {
    Some(T)
    | None

    public func getOrThrow(): T {
        match (this) {
            case Some(v) => v
            case None => throw NoneValueException()
        }
    }
}

public func id<T>(a: T): T {
    return a
}

public func composition<T1, T2, T3>(f: (T1) -> T2, g: (T2) -> T3): (T1) -> T3 {
    return {x: T1 => g(f(x))}
}
