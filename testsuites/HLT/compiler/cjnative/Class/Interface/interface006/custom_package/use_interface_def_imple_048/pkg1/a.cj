/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public var p1: Int64 = 0
public var p2: Int64 = 0
public var p3: Int64 = 0

public interface MyInterface1<T> {
    func foo1(): Int64
    func foo4(): Int64
    mut prop b1: Int64 {
        get() {
            foo1()
        }
        set(value) {
            p1 = value
        }
    }
}

public interface MyInterface2<T> {
    func foo2(): Int64
    func foo5(): Int64
    mut prop b2: Int64 {
        get() {
            foo2()
        }
        set(value) {
            p2 = value
        }
    }
}

public interface MyInterface3<T> {
    func foo3(): Int64
    func foo6(): Int64
    mut prop b3: Int64 {
        get() {
            foo3()
        }
        set(value) {
            p3 = value
        }
    }
}
