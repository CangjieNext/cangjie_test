// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package mymod.mod1

import std.collection.*

public let globalA = 0
private let globalB = 0

public class ToPair {
    public static func fromArray<T>(l: ArrayList<T>): (T, T) {
        return (l[0], l[1])
    }
}

public class ToPair2 {
    public static func fromArray<T>(l: ArrayList<T>, c!: String): (T, T) {
        println("${c}")
        return (l[0], l[1])
    }
}

public interface MyInterfaceA {
    func myfunc1() {}
}

public struct MyStructA <: MyInterfaceA {
    let a = 10
    let b = 20
    public func mystructfunc1(size: Int64) {
        var arr = Array<Int64>(size, repeat: 20)
        println("${arr.size}")
    }
}

public struct MyStructB {
    let a = 10
    let b = 20
    public func mystructfunc1() {
        println("bbbbbbbbbbb")
    }
}

public open class MyClassBase {
    public open func func3() {}
}

public class MyException <: Exception {
    public init() {
        super()
    }

    public init(message: String) {
        super(message)
    }

    protected override func getClassName(): String {
        return "MyException"
    }
}

private func my_common_func1() {
    throw MyException("this is myexception")
}

public func myfunc3() {
    println("aaaaaaaa")
}

public class MyClassA <: MyClassBase {
    public let field_a = 0;
    public let field_b = 0;
    let field_c = 0;
    public func myfunc1(a: Int64, b: Float64) {
        my_common_func1()
    }
    public func myfunc2(ms1: MyStructA, ms2: MyStructB) {
        println("aaaaaaaa")
    }
    public func myfunc3() {
        println("aaaaaaaa")
    }
}

private class MyClassB <: MyClassBase {
    public let field_a = 0;
    public let field_b = 0;
    public static let field_d = 0;
    let field_c = 0;
    public func myfunc1() {
        println("aaaaaaaa")
    }
    func myfunc2() {
        println("aaaaaaaa")
    }
    public func myfunc3() {
        println("aaaaaaaa")
    }
}

public struct Pair<T, U> {
    let x: T
    let y: U
    public init(a: T, b: U) {
        x = a
        y = b
        //my_common_func1()
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

public enum RGBColor {
    | Red | Green(UInt8) | Blue(UInt8)
}

public open class Node<K, V> where K <: Hashable & Equatable<K> & Comparable<K> {
    public var key: Option<K> = Option<K>.None
    public var value: Option<V> = Option<V>.None
    public static var NodeID = 110
    public init() {}

    public init(key: K, value: V) {
        this.key = Option<K>.Some(key)
        this.value = Option<V>.Some(value)
    }
    public func print() {
        match (this.key) {
            case Some(key) => println("has key")
            case _ => println("no key")
        }
    }
    public static func fromArray<T>(l: ArrayList<T>): (T, T) {
        return (l[0], l[1])
    }
    public operator func >(Key: K): Bool {
        return key == Key;
    }
    public operator func <(Key: K): Bool {
        return key == Key;
    }
    public operator func <<(Offset: Int64): Int64 {
        return 1 << Offset;
    }
    public operator func ==(Key: K): Bool {
        return key == Key;
    }

    public func mynodefunc1(a: K, b: V, c!: Int64 = 20) {
        println("${c}")
    }
    public static func mynodefunc2<T>(a: T, c!: Int64 = 20) {
        println("${c}")
    }
}

extend<K, V> Node<K, V> <: ToString {
    public func toString(): String {
        return "Node"
    }
}

extend<K, V> Node<K, V> {
    public func mynodefunc3<T>(a: T, b: T, c!: Int64 = 20, d!: Float64 = 40.0) {
        println("${c}")
    }
    public func mynodefunc4(color: RGBColor) {
        println("hahahah")
    }
    public func mynodefunc5(): () -> Int64 {
        func incrementer1(): Int64 {
            return 100
        }

        incrementer1
    }
    public func mynodefunc5(c: String): () -> Int64 {
        func incrementer(): Int64 {
            return 200
        }

        incrementer
    }
}

private class C {
    public var num: Int64 = 0
}

public func returnIncrementer(): () -> Unit {
    let c: C = C()

    func incrementer() {
        c.num++
    }

    incrementer
}
