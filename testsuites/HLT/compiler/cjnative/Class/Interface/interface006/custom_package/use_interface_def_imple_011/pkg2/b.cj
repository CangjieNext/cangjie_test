/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass<T> {
    public static var x: Float16 = 10.0
    static func f() {
        x = 20.0
        return x
    }
}

extend<T> myClass<T> <: MyInterface<T> {
    public static func foo1(): Float16 {
        f()
    }
}
