/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output %run_args


func doSomething1(a: Int64) {}

var a = { a: Int64 => doSomething1(a) }
var b = { a: Int64 => doSomething1(a) }
var c = doSomething1
var d = doSomething1

var e = Test
func Test(a: Int64): Unit {
    doSomething1(a)
}

func tryDoSomething1() {}

func foo<T>(a: (T)->Unit, b: (T)->Unit): Bool {
    return refEq<T, Unit>(a, b)
}

func goo(b: Bool): Unit {}

func hoo(b: Bool): Unit {}


func doSomeThing2<T>(a: (T)->Unit): (T)->Unit {
    a
}

func doSomeThing3(a: (Bool)->Unit): (Bool)->Unit {
    a
}

func qoo<T>(a: (T)->Unit): (T)->Unit {
    a
}

func woo<T>(a: T): Unit {
}

func eoo(a: (Int64) -> Unit): Bool {
    var x: (Int64)->Unit = qoo(a)
    return refEq<Int64, Unit>(x, woo<Int64>)
}

@Test
class FuncRefEqTest {
    @TestCase
    func funcRefEqTest01() {
        @Expect(refEq<Int64, Unit>(a, b), false)
        @Expect(refEq<Int64, Unit>(a, c), false)
        @Expect(refEq<Int64, Unit>(a, d), false)
        @Expect(refEq<Int64, Unit>(b, c), false)
        @Expect(refEq<Int64, Unit>(b, d), false)
        @Expect(refEq<Int64, Unit>(c, d), true)
    }

    @TestCase
    func funcRefEqTest02() {
        @Expect(foo<Bool>(goo, goo), true)
        @Expect(foo<Bool>(goo, hoo), false)
    }

    @TestCase
    func funcRefEqTest03() {
        var x = doSomeThing2<Bool>(goo)
        var y = doSomeThing3(goo)
        @Expect(refEq<Bool,Unit>(x, goo), true)
        @Expect(refEq<Bool,Unit>(y, goo), true)
        @Expect(refEq<Bool,Unit>(x, hoo), false)
        @Expect(refEq<Bool,Unit>(y, hoo), false)
    }
    
    @TestCase
    func funcRefEqTest04() {
        var a: (Int64)->Unit = woo<Int64>
        @Expect(eoo(a), true)
        @Expect(refEq<Int64, Unit>(a, woo<Int64>), true)
    } 
}