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

interface fatherInterface {
    mut func foo1(): Unit
    mut func foo2(a: Unit): Unit {
        foo1()
    }
    func foo4(): Int64
}

interface MyInterface <: fatherInterface {
    mut func foo3(): String {
        if (foo1() == ()) {
            return "success"
        } else {
            return "fail"
        }
    }
}

struct myStruct<T> <: MyInterface {
    var x = 10
    mut func f() {
        x = 20
    }
    public mut func foo1() {
        f()
    }
    public func foo4() {
        x
    }
}

main() {
    var s2: MyInterface = myStruct<MyInterface>()
    var s3: myStruct<MyInterface> = myStruct<MyInterface>()
    if (s2.foo2(()) == () && s2.foo4() == 20 && s2.foo3() == "success" && s3.foo3() == "success" && s3.foo2(()) == () &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
