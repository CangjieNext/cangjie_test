package inc

main(): Unit {

}
public open class A {}
public open class B {}
public open class F<T> {}

public interface IA {
    func foo(): Int64
}
public interface IB {}
public interface IC<A> {
    func foo(): Int64
}
public interface ID<A> {}
public interface IE<A, B, C> {
    func foo(): Int64
}

public struct SB<A, B> {}
public enum EB<T> {
    R | K
}

extend<A, B> SB<A, B> <: IC<B> {
    public func foo(): Int64 {
        0
    }
}
extend<T> EB<T> <: IE<T, T, IE<T, T, T>> {
    public func foo(): Int64 {
        0
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
