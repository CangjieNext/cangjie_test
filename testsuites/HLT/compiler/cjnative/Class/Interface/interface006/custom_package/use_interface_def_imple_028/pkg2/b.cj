/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public enum myenum {
    C
}

extend myenum <: MyInterface1<UInt32> & MyInterface2<UInt32> & MyInterface3<UInt32> {
    public func foo1(): Int64 {
        1
    }
    public func foo4(): Int64 {
        1
    }
    public func foo7(): Int64 {
        1
    }
}

public func call<T>(): Int64 {
    var en1: MyInterface1<UInt32> = myenum.C
    var en2: MyInterface2<UInt32> = myenum.C
    var en3: MyInterface3<UInt32> = myenum.C
    var en4: myenum = myenum.C

    if (!(en1.foo2(a: [B(), A()]) is B) && !(en1.foo3() is B) && en2.foo5(a: [A(), B()]) is B && en2.foo6() is B &&
        !(en3.foo8(a: [B(), A()]) is B) && !(en3.foo9() is B)) {
        if (!(en4.foo2(a: [B(), A()]) is B) && !(en4.foo3() is B) && en4.foo5(a: [A(), B()]) is B && en4.foo6() is B &&
            !(en4.foo8(a: [B(), A()]) is B) && !(en4.foo9() is B)) {
            return 0
        }
    }

    return 1
}
