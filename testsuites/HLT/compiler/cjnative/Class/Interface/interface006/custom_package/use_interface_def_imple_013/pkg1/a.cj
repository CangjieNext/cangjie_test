/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

interface MyInterface<T> {
    static func foo1(): Float64
    static func foo2<T>(a!: T): T {
        foo1();
        a
    }
}

class myClass<T> {
    static var x: Float64 = 10.0
    static func f() {
        x = 20.0
        return x
    }
}

extend<T> myClass<T> <: MyInterface<T> {
    public static func foo1(): Float64 {
        f()
    }
}

public func call(): Int64 {
    if (myClass<Float64>.foo2(a: 10.0) == 10.0 && myClass<Float64>.x == 20.0) {
        return 0
    } else {
        return 1
    }
}
