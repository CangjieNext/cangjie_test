/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

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
    public var x: Int64 = 10
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
