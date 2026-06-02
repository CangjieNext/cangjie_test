/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class C11 {

    public open func f31(): UInt64 {
        var a:UInt64 = 10
        return a
    }
    public open func f311(a:Int64): Int64 {
        return a
    }
}
class C21 <: C11 {
    public override func f31(): UInt64 {
        var a:UInt64 = 100
        return a
    }
    public func f311(a:Int64): Int64 {
        return a
    }
    public  func f311(a:Int64, b:Int64): Int64 {
        return a+b
    }
}
struct S11{
    public func s31(): UInt64 {
        var a:UInt64 = 10
        return a
    }
    public func s311(a:Int64): Int64 {
        return a
    }
    public func s311(a:Int64, b:Int64): Int64 {
        return a+b
    }
}
func test_fun() {
    var a = 10
    var b = 10
    var c = a + b
}
func test_fun1() {
    var a = 10
    var b = 10
    var c = a + b
    return c
}
func test_fun2(a:Int64, b:Int64) {
    var c = a + b
    return c
}
main() {
    var bbb=123.toString()
    let arr:Array<Int64>=[1,2,3]
    var eee=arr.isEmpty()
    let fff = 0..10 : 1
    let ggg=fff.iterator()
    var obj1 = C21()
    var obj2 = S11()
    test_fun()
    var a = test_fun1()
    var b = test_fun2(10, 20)
    var aab = obj1.f31()
    var aac = obj1.f311(10, 20)
    return 0
}
