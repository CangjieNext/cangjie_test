/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg3

import pkg1.*
import pkg2.*

public func call<T>(): Int64 {
    var class1: faterInterface<Float32> = myClass()
    var class2: MyInterface<Float32> = myClass()
    var class3: myClass = myClass()
    if (class1.foo2(a: 10.0) == 10.0 && class1.foo4() == 20.0 && class2.foo3(a: 10.0) == 20.0 && class2.foo4() == 20.0 &&
        class3.foo2(a: 10.0) == 10.0 && class3.x == 20.0) {
        return 0
    } else {
        return 1
    }
    return 0
}
