/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var p1 = 0
var p2 = 0
var p3 = 0

public interface MyInterface1<T> {
    func foo1(): Int64
    func foo4(): Int64
    mut prop b1: Int64 {
        get() {
            foo1()
        }
        set(value) {
            p1 = value
        }
    }
}

public interface MyInterface2<T> {
    func foo2(): Int64
    func foo5(): Int64
    mut prop b2: Int64 {
        get() {
            foo2()
        }
        set(value) {
            p2 = value
        }
    }
}

public interface MyInterface3<T> {
    func foo3(): Int64
    func foo6(): Int64
    mut prop b3: Int64 {
        get() {
            foo3()
        }
        set(value) {
            p3 = value
        }
    }
}

class myClass <: MyInterface1<Int64> & MyInterface2<Int64> & MyInterface3<Int64> {
    var x = 10
    public func foo1() {
        x = 20
        1
    }
    public func foo2() {
        x = 30
        2
    }
    public func foo3() {
        x = 40
        3
    }
    public func foo4() {
        x
    }
    public func foo5() {
        x
    }
    public func foo6() {
        x
    }
}

main() {
    var en1: MyInterface1<Int64> = myClass()
    var en2: MyInterface2<Int64> = myClass()
    var en3: MyInterface3<Int64> = myClass()
    var en4: myClass = myClass()
    en1.b1 = 1
    en2.b2 = 2
    en3.b3 = 3

    if (en1.b1 == 1 && en1.foo4() == 20 && p1 == 1 && en2.b2 == 2 && en2.foo5() == 30 && p2 == 2 && en3.b3 == 3 &&
        en3.foo6() == 40 && p3 == 3) {
        en4.b1 = 4
        en4.b2 = 4
        en4.b3 = 4
        if (en4.b1 == 1 && p1 == 4 && en4.b2 == 2 && p2 == 4 && en4.b3 == 3 && p3 == 4 && en4.x == 40) {
            return 0
        }
    }
    return 1
}
