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

public interface faterInterface<T> {
    func foo1(): T
    func foo3(): T
    func foo2(a!: T): T {
        foo1();
        return a
    }
}

public interface MyInterface<T> <: faterInterface<T> {
    mut func foo3(a!: T): T {
        foo1()
    }
}

class myClass {
    var x: Float32 = 10.0
    public func f(): Float32 {
        x = 20.0
        return x
    }
}

extend myClass <: MyInterface<Float32> {
    public func foo1(): Float32 {
        f()
    }
    public func foo3(): Float32 {
        x
    }
}

main() {
    var class1: faterInterface<Float32> = myClass()
    var class2: MyInterface<Float32> = myClass()
    var class3: myClass = myClass()

    if (class1.foo2(a: 10.0) == 10.0 && class1.foo3() == 20.0 && class2.foo3(a: 10.0) == 20.0 && class2.foo3() == 20.0 &&
        class3.foo2(a: 5.0) == 5.0 && class3.x == 20.0) {
        return 0
    } else {
        return 1
    }
}
