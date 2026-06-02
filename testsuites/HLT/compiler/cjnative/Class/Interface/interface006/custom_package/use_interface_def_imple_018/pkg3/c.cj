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

public func call(): Int64 {
    var s1: fatherInterface<A> = myStruct()
    var s2: MyInterface = myStruct()
    var s3: myStruct = myStruct()

    if (s1.foo2(a: A()) is A && s1.foo3() == 20 && s2.foo2(a: A()) is A && s2.foo3() == 20 && s3.foo2(a: A()) is A &&
        s3.x == 20) {
        return 0
    }
    return 1
}
