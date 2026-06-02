/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface1 {
    func foo1(a!: Int64): Int64 {
        a + b1
    }
    prop b1: Int64 {
        get() {
            1
        }
    }
}

public interface MyInterface1 <: fatherInterface1 {}

public interface fatherInterface2 {
    func foo2(a!: Int64): Int64 {
        a + b2
    }
    prop b2: Int64 {
        get() {
            2
        }
    }
}

public interface MyInterface2 <: fatherInterface2 {}

public interface fatherInterface3 {
    func foo3(a!: Int64): Int64 {
        a + b3
    }
    prop b3: Int64 {
        get() {
            3
        }
    }
}

public interface MyInterface3 <: fatherInterface3 {}

extend Int32 <: MyInterface1 & MyInterface2 & MyInterface3 {}
