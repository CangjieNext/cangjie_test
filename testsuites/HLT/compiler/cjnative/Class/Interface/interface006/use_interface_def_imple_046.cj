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

enum myEnum<T> <: MyInterface1<Int32> & MyInterface2<Int32> & MyInterface3<Int32> {
    A

    public static func foo1(): Int32 {
        1
    }
    public static func foo2(): Int32 {
        2
    }
    public static func foo3(): Int32 {
        3
    }
}

main() {
    if (myEnum<Int64>.b1() == 1 && myEnum<Int64>.b2() == 2 && myEnum<Int64>.b3() == 3) {
        return 0
    } else {
        return 1
    }
}
