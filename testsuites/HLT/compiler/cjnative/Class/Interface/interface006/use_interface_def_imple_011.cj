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

interface fatherInterface<T> {
    static func foo1(): Float16
    static func foo2<T>(a: T): T {
        return a
    }
}

interface MyInterface<T> <: fatherInterface<T> {
    static func foo2<T>(a: T): T {
        foo1()
        return a
    }
}

class myClass<T> {
    static var x: Float16 = 10.0
    static func f() {
        x = 20.0
        return x
    }
}

extend<T> myClass<T> <: MyInterface<T> {
    public static func foo1(): Float16 {
        f()
    }
}

main() {
    if (myClass<Float16>.foo2(10.0) == 10.0 && myClass<Float16>.x == 20.0) {
        return 0
    } else {
        return 1
    }
}
