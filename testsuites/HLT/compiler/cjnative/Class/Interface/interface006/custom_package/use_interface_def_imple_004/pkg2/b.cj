/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

class myClass <: MyInterface<Int64> {
    var x: Int64 = 10
    func f() {
        x = 20
        return x
    }
    public func foo1(): Int64 {
        f()
    }
    public func foo4(): Int64 {
        x
    }
}

public func call(): Int64 {
    var c1: fatherInterface<Int64> = myClass()
    var c2: MyInterface<Int64> = myClass()
    var c3: myClass = myClass()

    if (c1.foo2(a: 20) == 40 && c1.foo4() == 20 && c2.foo3() == 50 && c2.foo4() == 20 && c3.foo3() == 50 && c3.x == 20) {
        return 0
    } else {
        return 1
    }
}
