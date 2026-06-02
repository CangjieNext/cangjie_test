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
    static func foo1(): T
    static func foo2<K>(a: K): K {
        foo1();
        a
    }
}

interface MyInterface <: faterInterface<Float16> {
    static func foo3(): Float16 {
        foo2<Float16>(5.0)
    }
    static func foo4(): Float16
}

extend UIntNative <: MyInterface {
    static func foo5(): Float16 {
        1.0
    }
    public static func foo4(): Float16 {
        foo3()
    }
    public static func foo1(): Float16 {
        foo5()
    }
}

main() {
    if (UIntNative.foo3() == 5.0 && UIntNative.foo4() == 5.0 && UIntNative.foo2<Float16>(1.0) == 1.0) {
        return 0
    } else {
        return 1
    }
}
