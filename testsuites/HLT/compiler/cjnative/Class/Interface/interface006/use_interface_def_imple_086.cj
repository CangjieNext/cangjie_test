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

public class A {
    func f() {
        1
    }
}

public interface faterInterface {
    static func foo1(): Int64
    static func foo2<T>(a: T): Int64 where T <: A {
        a.f() + foo1()
    }
    static func foo3(): Int64 {
        foo2<A>(A())
    }
}

interface MyInterface <: faterInterface {}

extend<T> Option<T> <: MyInterface {
    static func foo(): Int64 {
        30
    }
    public static func foo1(): Int64 {
        foo()
    }
}

main() {
    if (Option<Int64>.foo3() == 31) {
        return 0
    } else {
        return 1
    }
}
