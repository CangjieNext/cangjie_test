/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*
//泛型类中对类型变元的使用是T/Array<T>/ArrayList<T>/(T)->T/(T,T)
func aoo2<T>(x: Array<T>): Array<T> {
    var a = x
    return a
}
// 泛型类的类型变元用作T
class Data1<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}
// 泛型类的类型变元用作T[]
class Data2<T> {
    public var a: Array<T>
    public init(x: Array<T>) {
        a = x
    }
}
// 泛型类的类型变元用作ArrayList<T>
class Data3<T> {
    public var a: ArrayList<T>
    public init(x: ArrayList<T>) {
        a = x
    }
}
// 泛型类的类型变元用作(T)->T
class Data4<T> {
    public var a: (T) -> T
    public init(x: (T) -> T) {
        a = x
    }
}
// 泛型类的类型变元用作(T,T)
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
    //[a0,a0].toArray()
    var b2 = Data2<Int32>([a0, a0]).a
    Book<Array<Int32>>(b2)
    //    var e2 = Data2([a0,a0]) // 此处B103无法推断
    //    var f2 = Data2([a0,a0].toArray()) // 此处B103无法推断
    //    Book<Array<Int32>>(e2)
    //    Book<Array<Int32>>(f2)

    func x(a: Int64): Int32 {
        1
    }
    var b3 = Data3<Int32>(ArrayList<Int32>(10, x)).a
    //   var e3 = Data3(ArrayList<Int32>(10,x)).a // 此处B103无法推断
    Book<ArrayList<Int32>>(b3)
    //    Book<ArrayList<Int32>>(e3)

    var b4 = Data4<Int32>({x: Int32 => 1}).a
    Data4<Int32>(b4)
    //    var c4:Data4<Int32> = Data4(b4) // 此处B103无法推断，虽然变量声明的时候加了定义，也没能推断出实例Data4的类型
    Book<(Int32) -> Int32>(b4)

    var b5 = Data5<Int32>((1, 2)).a
    Data5<Int32>(b5)
    //    var b5 : Data5<Int32> = Data5(b5) // 此处B103无法推断，虽然变量声明的时候加了定义，也没能推断出实例Data4的类型
    Book<(Int32, Int32)>(b5)
}

func run(): Int64 {
    test_constructor_call()
    return 0
}

main(): Int64 {
    return run()
}
