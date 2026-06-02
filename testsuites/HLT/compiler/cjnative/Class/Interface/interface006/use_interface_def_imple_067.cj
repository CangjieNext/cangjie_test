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

public open class A {}

public class B <: A {}

public interface fatherInterface1<T> {
    func foo1(): Int64
    func foo2(a!: Array<A>): A {
        a[foo1()]
    }
}

public interface MyInterface1<T> <: fatherInterface1<T> {
    func foo3(): A {
        A()
    }
}

public interface fatherInterface2<T> {
    func foo4(): Int64
    func foo5(a!: Array<A>): A {
        a[foo4()]
    }
}

public interface MyInterface2<T> <: fatherInterface2<T> {
    func foo6(): A {
        B()
    }
}

public interface fatherInterface3<T> {
    func foo7(): Int64
    func foo8(a!: Array<A>): A {
        a[foo7()]
    }
}

public interface MyInterface3<T> <: fatherInterface3<T> {
    func foo9(): A {
        A()
    }
}

public enum myenum<T> {
    C
}

extend<T> myenum<T> <: MyInterface1<UInt32> & MyInterface2<UInt32> & MyInterface3<UInt32> {
    public func foo1(): Int64 {
        1
    }
    public func foo4(): Int64 {
        1
    }
    public func foo7(): Int64 {
        1
    }
}

main() {
    var en1: MyInterface1<UInt32> = myenum<Rune>.C
    var en2: MyInterface2<UInt32> = myenum<Rune>.C
    var en3: MyInterface3<UInt32> = myenum<Rune>.C
    var en4: myenum<Rune> = myenum<Rune>.C

    if (!(en1.foo2(a: [B(), A()]) is B) && !(en1.foo3() is B) && en2.foo5(a: [A(), B()]) is B && en2.foo6() is B &&
        !(en3.foo8(a: [B(), A()]) is B) && !(en3.foo9() is B)) {
        if (!(en4.foo2(a: [B(), A()]) is B) && !(en4.foo3() is B) && en4.foo5(a: [A(), B()]) is B && en4.foo6() is B &&
            !(en4.foo8(a: [B(), A()]) is B) && !(en4.foo9() is B)) {
            return 0
        }
    }

    return 1
}
