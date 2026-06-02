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
    mut func foo2(a: Unit): Unit {
        foo1()
    }
    func foo4(): Int64
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
