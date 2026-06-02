/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface1<T> {
    static func foo1(): Int32
    static func b1(): Int32 {
        foo1()
    }
}

public interface MyInterface2<T> {
    static func foo2(): Int32
    static func b2(): Int32 {
        foo2()
    }
}

public interface MyInterface3<T> {
    static func foo3(): Int32
    static func b3(): Int32 {
        foo3()
    }
}
