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
    var en1: MyInterface1<Int64> = myClass()
    var en2: MyInterface2<Int64> = myClass()
    var en3: MyInterface3<Int64> = myClass()
    var en4: myClass = myClass()
    en1.b1 = 1
    en2.b2 = 2
    en3.b3 = 3

    if (en1.b1 == 1 && en1.foo4() == 20 && p1 == 1 && en2.b2 == 2 && en2.foo5() == 30 && p2 == 2 && en3.b3 == 3 &&
        en3.foo6() == 40 && p3 == 3) {
        en4.b1 = 4
        en4.b2 = 4
        en4.b3 = 4
        if (en4.b1 == 1 && p1 == 4 && en4.b2 == 2 && p2 == 4 && en4.b3 == 3 && p3 == 4 && en4.x == 40) {
            return 0
        }
    }
    return 1
}
