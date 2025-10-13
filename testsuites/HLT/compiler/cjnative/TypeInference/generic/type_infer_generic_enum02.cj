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
//泛型enum对类型变元的使用是T/Array<T>/ArrayList<T>/(T)->T/(T,T)

// 泛型enum的类型变元用作T
enum TimeUnit1<T> {
    Year(T)
}

var time1 = TimeUnit1<Int64>.Year(20)
var res1: Int64 = match (time1) {
    case Year(20) => 2020
    case _ => 0
}

// 泛型enum的类型变元用作T[]
enum TimeUnit2<T> {
    Year(Array<T>)
}

var time2 = TimeUnit2<Int64>.Year([20, 30])
var res2: Int64 = match (time2) {
    case Year(a) => a[0]
    case _ => 0
}
// 泛型enum的类型变元用作ArrayList<T>
enum TimeUnit3<T> {
    Year(ArrayList<T>)
}

func x(a: Int64): Int32 {
    1
}

var time3 = TimeUnit3<Int32>.Year(ArrayList<Int32>(10, x))
var res3: Int64 = match (time3) {
    case Year(a) => a.size
    case _ => 0
}
// 泛型enum的类型变元用作(T)->T
enum TimeUnit4<T> {
    Year((T) -> T)
}

var time4 = TimeUnit4<Int32>.Year({x: Int32 => 1})
var res4: Int32 = match (time4) {
    case Year(a) => a(1)
    case _ => 0
}
// 泛型enum的类型变元用作(T,T)
enum TimeUnit5<T> {
    Year((T, T))
}

var time5 = TimeUnit5<Int64>.Year((1, 2))
var res5: Int64 = match (time5) {
    case Year(a) => a[0]
    case _ => 0
}

func test_constructor_call(): Int64 {
    if (res1 != 2020) {
        return 1
    }
    if (res2 != 20) {
        return 1
    }
    if (res3 != 10) {
        return 1
    }
    if (res4 != 1) {
        return 1
    }
    if (res5 != 1) {
        return 1
    }
    return 0
}

func run(): Int64 {
    return test_constructor_call()
}

main(): Int64 {
    return run()
}
