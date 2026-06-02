/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public struct Mystruct<T> <: MyInterface<T> {
    public var x: T
    public init(a: T) {
        x = a
    }
    mut func f() {
        return x
    }
    public mut func foo1(): T {
        f()
    }
    public mut func foo3(): T {
        x
    }
}
