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

public interface fatherInterface1<T> {
    static func foo1(): Int8
    static func b1(): Int8 {
        foo1()
    }
}

public interface MyInterface1<T> <: fatherInterface1<T> {
    static func b1(): Int8 {
        foo1() + foo1()
    }
}

public interface fatherInterface2<T> {
    static func foo2(): Int8
    static func b2(): Int8 {
        foo2()
    }
}

public interface MyInterface2<T> <: fatherInterface2<T> {
    static func b2(): Int8 {
        foo2() + foo2()
    }
}

public interface fatherInterface3<T> {
    static func foo3(): Int8
    static func b3(): Int8 {
        foo3()
    }
}

public interface MyInterface3<T> <: fatherInterface3<T> {
    static func b3(): Int8 {
        foo3() + foo3()
    }
}

public class myClass<T> {
    static var x: Int8 = 10
}

extend<T> myClass<T> <: MyInterface1<Float16> & MyInterface2<Float16> & MyInterface3<Float16> {
    public static func foo1(): Int8 {
        x = 20
        1
    }
    public static func foo2(): Int8 {
        x = 20
        2
    }
    public static func foo3(): Int8 {
        x = 20
        3
    }
}

main() {
    if (myClass<Int64>.b1() == 2 && myClass<Int64>.b2() == 4 && myClass<Int64>.b3() == 6 && myClass<Int64>.x == 20) {
        return 0
    } else {
        return 1
    }
}
