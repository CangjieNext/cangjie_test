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
    mut func foo1(): UInt64
    mut func foo3(): UInt64
    mut func foo2(a!: UInt64): UInt64 {
        a + foo1()
    }
}

struct Mystruct<T> {
    var x: UInt64 = 10
    mut func f() {
        x = 20
        return x
    }
}

extend<T> Mystruct<T> <: MyInterface<T> {
    public mut func foo1(): UInt64 {
        f()
    }
    public mut func foo3(): UInt64 {
        x
    }
}

main() {
    var s1: Mystruct<UInt64> = Mystruct<UInt64>()
    var s2: MyInterface<UInt64> = Mystruct<UInt64>()
    if (s2.foo2(a: 10) == 30 && s2.foo3() == 20 && s1.foo2(a: 5) == 25 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
