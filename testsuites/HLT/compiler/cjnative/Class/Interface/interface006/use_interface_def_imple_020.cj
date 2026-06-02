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

public interface fatherInterface {
    mut func foo1(): Unit
    func foo4(): Int64
    mut func foo2(a: Unit): Unit {
        foo1()
    }
}

public interface MyInterface <: fatherInterface {
    mut func foo3(): String {
        if (foo1() == ()) {
            return "success"
        } else {
            return "fail"
        }
    }
}

public struct myStruct <: MyInterface {
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
    var s2: MyInterface = myStruct()
    var s3: myStruct = myStruct()
    if (s2.foo3() == "success" && s3.foo3() == "success" && s3.foo2(()) == () && s3.x == 20 && s2.foo2(()) == () &&
        s2.foo4() == 20) {
        return 0
    } else {
        return 1
    }
}
