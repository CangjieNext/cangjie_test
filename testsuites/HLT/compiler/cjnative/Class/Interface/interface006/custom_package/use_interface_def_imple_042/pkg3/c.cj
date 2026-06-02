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
    var en1: MyInterface1<Int64> = myEnum<MyInterface1<Int64>>.A
    var en2: MyInterface2<Int64> = myEnum<MyInterface1<Int64>>.A
    var en3: MyInterface3<Int64> = myEnum<MyInterface1<Int64>>.A
    var en4: myEnum<MyInterface1<Int64>> = myEnum<MyInterface1<Int64>>.A

    if (en1.b1 == 1 && en2.b2 == 2 && en3.b3 == 3) {
        return 0
    }
    return 1
}
