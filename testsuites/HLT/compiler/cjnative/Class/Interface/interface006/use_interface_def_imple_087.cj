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

public interface faterInterface1<T> {
    mut func foo1(): T
    mut func foo2(a!: T): T {
        foo1()
    }
}

public interface MyInterface1<T> <: faterInterface1<T> {
    mut func foo2(a!: T): T {
        foo1()
    }
}

public interface faterInterface2<T> {
    mut func foo3(): T
    mut func foo4(a!: T): T {
        foo3()
    }
}

public interface MyInterface2<T> <: faterInterface2<T> {
    mut func foo4(a!: T): T {
        foo3()
    }
}

public interface faterInterface3<T> {
    mut func foo5(): T
    mut func foo6(a!: T): T {
        foo5()
    }
}

public interface MyInterface3<T> <: faterInterface3<T> {
    mut func foo6(a!: T): T {
        foo5()
    }
}

extend<T> Array<T> <: MyInterface1<Bool> & MyInterface2<Bool> & MyInterface3<Bool> {
    public mut func foo(): Bool {
        true
    }
    public mut func foo1(): Bool {
        foo3()
    }
    public mut func foo3(): Bool {
        foo5()
    }
    public mut func foo5(): Bool {
        foo()
    }
}

main() {
    var a1: faterInterface1<Bool> = [true]
    var a2: MyInterface2<Bool> = [true]
    var a3: MyInterface3<Bool> = [true]
    var a4: Array<Int64> = [1]

    if (a1.foo2(a: false) && a2.foo4(a: false) && a3.foo6(a: false)) {
        if (a4.foo2(a: false) && a4.foo4(a: false) && a4.foo6(a: false)) {
            return 0
        }
    }
    return 1
}
