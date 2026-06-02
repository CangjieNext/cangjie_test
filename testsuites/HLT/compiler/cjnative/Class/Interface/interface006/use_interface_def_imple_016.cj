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
    static func foo1(): Bool
    static func foo2<T>(a!: T): T {
        foo1();
        return a
    }
}

public interface MyInterface<T> <: faterInterface<T> {
    static func foo3<T>(a: T): T {
        foo1();
        return a
    }
}

public class myClass<T> <: MyInterface<Bool> {
    static var x: Bool = true
    public static func f(): Bool {
        x = false
        return x
    }
    public static func foo1(): Bool {
        f()
    }
}

main() {
    if (myClass<Bool>.foo2(a: true) && !myClass<Bool>.x) {
        return 0
    } else {
        return 1
    }
}
