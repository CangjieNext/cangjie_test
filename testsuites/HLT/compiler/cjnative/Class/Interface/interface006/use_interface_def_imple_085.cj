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

struct A {
    var x = 10
    var y = 20
    var z = 30
}

interface MyInterface1<T> {
    mut func foo1(): Int64
    mut func foo2(a!: A): Int64 {
        a.x + foo1()
    }
}

interface MyInterface2<T> {
    mut func foo3(): Int64
    mut func foo4(a!: A): Int64 {
        a.y + foo3()
    }
}

interface MyInterface3<T> {
    mut func foo5(): Int64
    mut func foo6(a!: A): Int64 {
        a.z + foo5()
    }
}

extend Unit <: MyInterface1<A> & MyInterface2<A> & MyInterface3<A> {
    public func foo1(): Int64 {
        foo3()
    }
    public func foo3(): Int64 {
        foo5()
    }
    public func foo5(): Int64 {
        return A().x
    }
}

main() {
    var u1: MyInterface1<A> = ()
    var u2: MyInterface2<A> = ()
    var u3: MyInterface3<A> = ()
    var u4: Unit = ()

    if (u1.foo2(a: A()) == 20 && u2.foo4(a: A()) == 30 && u3.foo6(a: A()) == 40) {
        if (u4.foo2(a: A()) == 20 && u4.foo4(a: A()) == 30 && u4.foo6(a: A()) == 40) {
            return 0
        }
    }
    return 1
}
