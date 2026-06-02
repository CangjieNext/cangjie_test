/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

class myClass<T> <: MyInterface1<Int32> & MyInterface2<Int32> & MyInterface3<Int32> {
    static var x1 = 0
    static var x2 = 0
    static var x3 = 0
    public static func foo1(): Int32 {
        x1 = 10
        1
    }
    public static func foo2(): Int32 {
        x2 = 20
        2
    }
    public static func foo3(): Int32 {
        x3 = 30
        3
    }
}
