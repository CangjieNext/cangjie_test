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
    static func foo1(): T
    static func foo2<K>(a!: K): K {
        a
    }
}

var x: Int32 = 0

enum myEnum <: MyInterface<Int32> {
    A

    public static func foo1(): Int32 {
        x = 1
        return x
    }
}

main() {
    if (myEnum.foo2<(Int32, Int32)>(a: (1, 2))[0] == myEnum.foo1()) {
        return 0
    } else {
        return 1
    }
}
