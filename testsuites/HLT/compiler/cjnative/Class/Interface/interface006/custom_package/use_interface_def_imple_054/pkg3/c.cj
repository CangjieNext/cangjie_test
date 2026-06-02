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
    var s1: Mystruct<Int32> = Mystruct<Int32>(20)
    var s2: MyInterface<Int32> = Mystruct<Int32>(20)
    if (s2.foo2() == 20 && s2.foo3() == 20 && s1.foo2() == 20 && s1.x == 20) {
        return 0
    } else {
        return 1
    }
}
