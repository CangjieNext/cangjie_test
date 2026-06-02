// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

func aoo2<T>(x: Array<T>): Array<T> {
    var a = x
    return a
}

class Data1<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Data2<T> {
    public var a: Array<T>
    public init(x: Array<T>) {
        a = x
    }
}

class Data3<T> {
    public var a: ArrayList<T>
    public init(x: ArrayList<T>) {
        a = x
    }
}

class Data4<T> {
    public var a: (T) -> T
    public init(x: (T) -> T) {
        a = x
    }
}

class Data5<T> {
    public var a: (T, T)
    public init(x: (T, T)) {
        a = x
    }
}

class Book<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func test_constructor_call() {
    var b1 = Data1<Int32>(1).a
    Book<Int32>(b1)

    var a0: Int32 = 1
    [a0, a0].toArray()
    var b2 = Data2<Int32>([a0, a0]).a
    Book<Array<Int32>>(b2)
    var e2 = Data2([a0, a0]) //expr Data2([a0, a0])
    var f2 = Data2([a0, a0].toArray()) //expr Data2([a0, a0].toArray())
    func x(a: Int64): Int32 {
        1
    }
    var b3 = Data3<Int32>(ArrayList<Int32>(10, x)).a // Data3<Int32>(ArrayList<Int32>(10, x)).a
    var e3 = Data3(ArrayList<Int32>(10, x)).a // expr Data3(ArrayList<Int32>(10, x)).a
    Book<ArrayList<Int32>>(b3)
    Book<ArrayList<Int32>>(e3)

    var b4 = Data4<Int32>({x: Int32 => 1}).a
    Data4<Int32>(b4) //expr Data4<Int32>(b4)
    var c4: Data4<Int32> = Data4(b4)
    Book<(Int32) -> Int32>(b4) //expr Book<(Int32) -> Int32>(b4)

    var b5 = Data5<Int32>((1, 2)).a
    Data5<Int32>(b5)
}

main(): Int64 {
    test_constructor_call()
    return 0
}
