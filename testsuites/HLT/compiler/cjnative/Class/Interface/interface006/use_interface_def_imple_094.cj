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
    func foo1(): T
    prop b1: T {
        get() {
            foo1()
        }
    }
}

public interface MyInterface1 <: faterInterface1<Bool> {
    prop b1: Bool {
        get() {
            true
        }
    }
}

public interface faterInterface2<T> {
    func foo3(): T
    prop b2: T {
        get() {
            foo3()
        }
    }
}

public interface MyInterface2 <: faterInterface2<Bool> {
    prop b2: Bool {
        get() {
            true
        }
    }
}

public interface faterInterface3<T> {
    func foo5(): T
    prop b3: T {
        get() {
            foo5()
        }
    }
}

public interface MyInterface3 <: faterInterface3<Bool> {
    prop b3: Bool {
        get() {
            true
        }
    }
}

extend<T> Array<T> <: MyInterface1 & MyInterface2 & MyInterface3 {
    public func foo(): Bool {
        false
    }
    public func foo1(): Bool {
        foo3()
    }
    public func foo3(): Bool {
        foo5()
    }
    public func foo5(): Bool {
        foo()
    }
}

main() {
    var a1: faterInterface1<Bool> = [true]
    var a2: MyInterface2 = [true]
    var a3: MyInterface3 = [true]
    var a4: Array<Int64> = [1]
    print(a1.b1.toString())
    print(a2.b2.toString())
    print(a3.b3.toString())
    print(a4.b2.toString())
    print(a4.b3.toString())
    print(a4.b1.toString())
    if (a1.b1 && a2.b2 && a3.b3) {
        if (a4.b1 && a4.b2 && a4.b3) {
            return 0
        }
    }
    return 1
}
