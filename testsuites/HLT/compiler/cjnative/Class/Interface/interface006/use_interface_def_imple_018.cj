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
    mut func foo3(): Int64
    mut func foo2(a!: A): A {
        foo1();
        a
    }
}

public interface MyInterface <: fatherInterface<A> {}

public struct myStruct {
    var x: Int64 = 10
    mut func f() {
        x = 20
        return x
    }
}

extend myStruct <: MyInterface {
    public mut func foo1(): Int64 {
        f()
    }
    public mut func foo3(): Int64 {
        x
    }
}

main() {
    var s1: fatherInterface<A> = myStruct()
    var s2: MyInterface = myStruct()
    var s3: myStruct = myStruct()

    if (s1.foo2(a: A()) is A && s1.foo3() == 20 && s2.foo2(a: A()) is A && s2.foo3() == 20 && s3.foo2(a: A()) is A &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
