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

interface MyInterface1<T> {
    static func foo1(): Int32
    static func b1(): Int32 {
        foo1()
    }
}

interface MyInterface2<T> {
    static func foo2(): Int32
    static func b2(): Int32 {
        foo2()
    }
}

interface MyInterface3<T> {
    static func foo3(): Int32
    static func b3(): Int32 {
        foo3()
    }
}

class myClass<T> <: MyInterface1<Int32> & MyInterface2<Int32> & MyInterface3<Int32> {
    static var x1 = 0
    static var x2 = 0
    static var x3 = 0
    public static func foo1(): Int32 {
        x1 = 10
        1
    }
    public static func foo2(): Int32 {
        x2 = 20
        2
    }
    public static func foo3(): Int32 {
        x3 = 30
        3
    }
}

main() {
    if (myClass<MyInterface1<Int32>>.b1() == 1 && myClass<MyInterface1<Int32>>.b2() == 2 &&
        myClass<MyInterface1<Int32>>.b3() == 3 && myClass<MyInterface1<Int32>>.x1 == 10 &&
        myClass<MyInterface1<Int32>>.x2 == 20 && myClass<MyInterface1<Int32>>.x3 == 30) {
        return 0
    } else {
        return 1
    }
}
