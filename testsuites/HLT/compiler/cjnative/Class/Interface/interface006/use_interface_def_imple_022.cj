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
    func foo2(): T {
        foo1()
    }
}

public interface MyInterface <: faterInterface<Array<Int64>> {}

public class class1<T> <: MyInterface {
    var x: Array<Int64> = [1, 2]
    func f() {
        x = [3, 4]
        return x
    }
    public func foo1(): Array<Int64> {
        f()
    }
}

public class class2<T> <: MyInterface {
    var x: Array<Int64> = [1, 2]
    func f() {
        x = [5, 6]
        return x
    }
    public func foo1(): Array<Int64> {
        f()
    }
}

public class class3<T> <: MyInterface {
    var x: Array<Int64> = [1, 2]
    func f() {
        x = [7, 8]
        return x
    }
    public func foo1(): Array<Int64> {
        f()
    }
}

main() {
    var c1: faterInterface<Array<Int64>> = class3<Array<Int64>>()
    var c2: MyInterface = class3<Array<Int64>>()
    var c3: class1<Array<Int64>> = class1<Array<Int64>>()
    var c4: class2<Array<Int64>> = class2<Array<Int64>>()
    var c5: class3<Array<Int64>> = class3<Array<Int64>>()

    c3.foo2()
    c4.foo2()
    c5.foo2()

    if (c1.foo2()[0] == 7 && c1.foo2()[1] == 8 && c3.x[0] == 3 && c4.x[0] == 5 && c5.x[0] == 7) {
        return 0
    } else {
        return 1
    }
}
