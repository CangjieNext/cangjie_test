/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface<T> {
    mut func foo1(): T
    mut func foo2(): T {
        foo1()
    }
    mut func foo3(): T
}

public struct Mystruct <: MyInterface<Int32> {
    var x: Int32 = 10
    mut func f() {
        x = 20
        return x
    }
    public mut func foo1(): Int32 {
        f()
    }
    public mut func foo3(): Int32 {
        x
    }
}

public func call(): Int64 {
    var s1: Mystruct = Mystruct()
    var s2: MyInterface<Int32> = Mystruct()
    if (s2.foo2() == 20 && s2.foo3() == 20 && s1.foo2() == 20 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
