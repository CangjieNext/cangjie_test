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

func call(): Int64 {
    var struct1: faterInterface<Bool> = myStruct<faterInterface<Bool>>()
    var struct2: MyInterface<Bool> = myStruct<faterInterface<Bool>>()
    var struct3: myStruct<faterInterface<Bool>> = myStruct<faterInterface<Bool>>()

    if (!struct1.foo2(5, true) && !struct2.foo2(11, false) && !struct3.foo2(10, true) && !struct3.x) {
        return 0
    } else {
        return 1
    }
    return 0
}
