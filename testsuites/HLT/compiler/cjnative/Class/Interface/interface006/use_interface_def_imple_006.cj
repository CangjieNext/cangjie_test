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
    static func foo2<T>(a!: T): T {
        foo1();
        return a
    }
}

public interface MyInterface <: faterInterface<UInt8> {}

public class myClass1 <: MyInterface {
    static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 20
        return x
    }
}

class myClass2 <: MyInterface {
    static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 30
        return x
    }
}

class myClass3 <: MyInterface {
    static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 40
        return x
    }
}

main() {
    if (myClass1.foo2<UInt8>(a: 1) == 1 && myClass2.foo2<UInt8>(a: 1) == 1 && myClass3.foo2<UInt8>(a: 1) == 1 &&
        myClass1.x == 20 && myClass2.x == 30 && myClass3.x == 40) {
        return 0
    }
    return 1
}
