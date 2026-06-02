/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public func call(): Int64 {
    var a1: faterInterface1<Bool> = [true]
    var a2: MyInterface2 = [true]
    var a3: MyInterface3 = [true]
    var a4: Array<Int64> = [1]
    print(a1.b1.toString())
    print(a2.b2.toString())
    print(a3.b3.toString())
    print(a4.b2.toString())
    print(a4.b3.toString())
    print(a4.b1.toString())
    if (a1.b1 && a2.b2 && a3.b3) {
        if (a4.b1 && a4.b2 && a4.b3) {
            return 0
        }
    }
    return 1
}
