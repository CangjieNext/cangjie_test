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

interface faterInterface<T> {
    mut func foo1(): T
    mut func foo2(): ?T {
        return Some(foo1())
    }
    mut func foo4(): T
}

interface MyInterface<T> <: faterInterface<T> {
    mut func foo3(): T {
        foo1()
    }
}

struct myStruct<T> {
    var x: Int64 = 1
    public mut func f(): Int64 {
        x = 10
        return x
    }
}

extend<T> myStruct<T> <: MyInterface<Int64> {
    public mut func foo1(): Int64 {
        f()
    }
    public mut func foo4(): Int64 {
        x
    }
}

main() {
    var struct1: faterInterface<Int64> = myStruct<Array<Int64>>()
    var struct2: MyInterface<Int64> = myStruct<Array<Int64>>()
    var struct3: myStruct<Array<Int64>> = myStruct<Array<Int64>>()

    var s1: Int64 = match (struct1.foo2()) {
        case Some(x) => x
        case _ => 0
    }
    var s2: Int64 = match (struct2.foo2()) {
        case Some(x) => x
        case _ => 0
    }
    var s3: Int64 = match (struct3.foo2()) {
        case Some(x) => x
        case _ => 0
    }

    if (struct1.foo4() == 10 && struct2.foo4() == 10 && s1 == 10 && s2 == struct2.foo3() && s3 == 10 &&
        struct3.foo3() == 10 && struct3.x == 10) {
        return 0
    } else {
        return 1
    }
}
