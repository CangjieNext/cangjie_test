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

interface MyInterface<T> {
    mut func foo1(): T
    mut func foo3(): T
    mut func foo2(): T {
        foo1()
    }
}

struct Mystruct<T> <: MyInterface<T> {
    var x: T
    init(a: T) {
        x = a
    }
    mut func f() {
        return x
    }
    public mut func foo1(): T {
        f()
    }
    public mut func foo3(): T {
        x
    }
}

main() {
    var s1: Mystruct<Int32> = Mystruct<Int32>(20)
    var s2: MyInterface<Int32> = Mystruct<Int32>(20)

    if (s2.foo2() == 20 && s2.foo3() == 20 && s1.foo2() == 20 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
