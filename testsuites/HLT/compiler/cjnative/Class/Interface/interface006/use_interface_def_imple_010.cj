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

public interface faterInterface {
    func foo1(): UIntNative
    func foo2(a: UIntNative): UIntNative {
        a + foo1()
    }
}

interface MyInterface <: faterInterface {}

enum enum1 {
    A | B(UIntNative)
}

extend enum1 <: MyInterface {
    public func foo1(): UIntNative {
        10
    }
}

enum enum2 {
    A | B(UIntNative)
}

extend enum2 <: MyInterface {
    public func foo1(): UIntNative {
        20
    }
}

enum enum3 {
    A | B(UIntNative)
}

extend enum3 <: MyInterface {
    public func foo1(): UIntNative {
        30
    }
}

main() {
    var en1: enum1 = enum1.B(enum1.A.foo2(enum1.A.foo1()))
    var en2: enum2 = enum2.B(enum2.A.foo2(enum2.A.foo1()))
    var en3: enum3 = enum3.B(enum3.A.foo2(enum3.A.foo1()))

    var e1 = match (en1) {
        case B(x) => x
        case _ => UIntNative(0)
    }
    var e2 = match (en2) {
        case B(x) => x
        case _ => UIntNative(0)
    }
    var e3 = match (en3) {
        case B(x) => x
        case _ => UIntNative(0)
    }

    if (e1 == 20 && e2 == 40 && e3 == 60) {
        return 0
    } else {
        return 1
    }
}
