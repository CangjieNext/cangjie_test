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
    func foo1(a: T): T {
        a
    }
}

interface MyInterface2<T> {
    func foo2(a: T): T {
        a
    }
}

interface MyInterface3<T> {
    func foo3(a: T): T {
        a
    }
}

extend<T> Option<T> <: MyInterface1<UIntNative> & MyInterface2<UIntNative> & MyInterface3<UIntNative> {}

main() {
    var u1: MyInterface1<UIntNative> = Some(1)
    var u2: MyInterface2<UIntNative> = Some(1)
    var u3: MyInterface3<UIntNative> = Some(1)
    var u4: Option<Rune> = Some(r'1')

    if (u1.foo1(1) == 1 && u2.foo2(1) == 1 && u3.foo3(1) == 1 && u4.foo1(1) == 1 && u4.foo2(1) == 1 && u4.foo3(1) == 1) {
        return 0
    } else {
        return 1
    }
}
