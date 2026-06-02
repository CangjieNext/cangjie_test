/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    mut func foo1(): T
    mut func foo2(): T {
        foo1()
    }
    func foo3(): T
}

public interface MyInterface<T> <: faterInterface<T> {
    mut func foo2(): T {
        foo1()
    }
}

struct myStruct <: MyInterface<UInt16> {
    var x: UInt16 = 10
    public mut func foo1(): UInt16 {
        x = 20
        return x
    }
    public func foo3(): UInt16 {
        x
    }
}

public func call(): Int64 {
    var struct1: faterInterface<UInt16> = myStruct()
    var struct2: MyInterface<UInt16> = myStruct()
    var struct3: myStruct = myStruct()

    if (struct1.foo2() == 20 && struct1.foo3() == 20 && struct2.foo2() == 20 && struct2.foo3() == 20 &&
        struct3.foo2() == 20 && struct3.x == 20) {
        return 0
    } else {
        return 1
    }
}
