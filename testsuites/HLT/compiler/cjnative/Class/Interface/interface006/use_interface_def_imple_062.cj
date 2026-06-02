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

public struct A {}

public interface fatherInterface<T> {
    mut func foo1(): Int64
    mut func foo2(a!: A): A {
        foo1();
        a
    }
    mut func foo3(): Int64
}

public interface MyInterface <: fatherInterface<A> {}

public struct myStruct<T> {
    var x: Int64 = 10
    mut func f() {
        x = 20
        return x
    }
}

extend<T> myStruct<T> <: MyInterface {
    public mut func foo1(): Int64 {
        f()
    }
    public mut func foo3(): Int64 {
        x
    }
}

main() {
    var s1: fatherInterface<A> = myStruct<String>()
    var s2: MyInterface = myStruct<String>()
    var s3: myStruct<String> = myStruct<String>()

    if (s1.foo2(a: A()) is A && s1.foo3() == 20 && s2.foo2(a: A()) is A && s2.foo3() == 20 && s3.foo2(a: A()) is A &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
