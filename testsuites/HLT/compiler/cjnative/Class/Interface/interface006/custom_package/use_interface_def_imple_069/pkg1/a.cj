/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface {
    static func foo2<T>(a: T): T {
        a
    }
    static prop b1: Int64 {
        get() {
            1
        }
    }
}

public interface MyInterface <: fatherInterface {
    static func foo3(): String {
        foo2<Int16>(12).toString()
    }
    static prop b2: Int64 {
        get() {
            2
        }
    }
}

extend Int8 <: MyInterface {}
